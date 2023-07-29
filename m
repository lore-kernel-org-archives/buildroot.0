Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD26EC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B5282037;
	Sat, 29 Jul 2023 22:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B5282037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWmuH2rSe5rM; Sat, 29 Jul 2023 22:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A90AD81FF7;
	Sat, 29 Jul 2023 22:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A90AD81FF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9D01BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AD2410D8
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AD2410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfmsrQltigDY for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:10:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF009410D1
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF009410D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id D804C240004;
 Sat, 29 Jul 2023 22:10:39 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:10:38 +0200
To: Jonathan Currier via buildroot <buildroot@buildroot.org>
Message-ID: <20230730001038.1be2bdba@windsurf>
In-Reply-To: <20230321100956.11869-1-dullfire@yahoo.com>
References: <20230321100956.11869-1-dullfire.ref@yahoo.com>
 <20230321100956.11869-1-dullfire@yahoo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690668640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFx8wxYO2AURYbBi59fAmbMNNoMlazRD1joOx8Xjzis=;
 b=gnY9/QnmxCHfn6MTOosVLZWFQnAjIjwkK0wbhL90GoDgeh6ZLE2/Q3MlrZASY1n2h6gGTP
 XtqETutcO3bZak2AGzrEauYQpHhYAdOtAvEHxcmzWbKjxCSI+IxHvEBJonJwf+V16SWa67
 0fHbIlOO2XlvEyFIgVAQUS81XSVENUwFq2MxNCzHjwrTfN82EFPrHrspNbGDB7D2IV+KGW
 kLzQO+p7T00Wzb6TeIJsWDQr91hKlnKLttQ1KHtaLvpbq7HUiMvlBKBoYdrjL+uX6DIHwG
 SNI21tUXbyamisrsa+ub9n4otm4h3qdIF+UGAapZpkYAlmCZt1GG/qGe9XBg0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gnY9/Qnm
Subject: Re: [Buildroot] [PATCH 1/1] package/musl: add aarch64_be
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
Cc: dullfire@yahoo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Mar 2023 05:09:56 -0500
Jonathan Currier via buildroot <buildroot@buildroot.org> wrote:

> From: Jonathan Currier <dullfire@yahoo.com>
> 
> Add aarch64_be to musl supported archs. Upstream musl
> already supports aarch64_be.
> 
> Signed-off-by: Jonathan Currier <dullfire@yahoo.com>
> ---
>  package/musl/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
