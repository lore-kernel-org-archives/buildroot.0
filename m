Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA15C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B98D60E3F;
	Mon,  1 Jan 2024 20:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B98D60E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zNmdOz5H-IR; Mon,  1 Jan 2024 20:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E933360E22;
	Mon,  1 Jan 2024 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E933360E22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFC3B1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4FA560E22
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4FA560E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9vygTmySikn for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:37:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7600560B29
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7600560B29
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5189DE0002;
 Mon,  1 Jan 2024 20:37:27 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:37:26 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101213726.66691b9a@windsurf>
In-Reply-To: <20231230181320.982102-1-fontaine.fabrice@gmail.com>
References: <20231230181320.982102-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704141447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBeRybVOppyLS0N7EeGTkhO5L4b9yYV7V4+r+9BGZCk=;
 b=dFGF2lSf8ewZfESpvg8ovrsEizxGMky4GY3AX52tduj8IVw1fiuNiJI2F91y5xSd3Uqke2
 lJ/c0tndq6Wca5wyS5NU9uUiMCJgTLcXMOf99orJ+nxZXe5hScPwF4/wHcdvdmN0CYPMDo
 QX79OfY6r1CdeqJjs6oEkxTpsxClkX06c+aY/Wp67LjIWBB4YOh2bRfE8zwxvQsP+ju11R
 YSygyjvR5Lpg15S1U6iSm7F1pjRUnMXpCw8Q4byim/TiUtsnUtXbRv7CdlclMpDsZT+ja4
 uoIvmGDySbxfXYglBt8UM9pD4idbOU0kIb55MxoVobD1hEfuqJLWrRnaIz7+hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dFGF2lSf
Subject: Re: [Buildroot] [PATCH 1/2] package/libiec61850: add mbedtls
 optional dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 19:13:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mbedtls is an optional dependency since bump to version 1.5.0 in
> commit a42e0e4600be785fa750c6b481c41a76d041df03 and
> https://github.com/mz-automation/libiec61850/commit/19f2cbf0e7066753476ff8c38c07a6f0df73a622
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libiec61850/libiec61850.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
