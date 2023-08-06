Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E6EC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309A360E92;
	Sun,  6 Aug 2023 21:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309A360E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWaLlM70d44c; Sun,  6 Aug 2023 21:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6C260FC6;
	Sun,  6 Aug 2023 21:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F6C260FC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 225841BF951
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278D3400C5
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 278D3400C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6HkUq3wUOTO for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:58:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43626401F1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43626401F1
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC477E0003;
 Sun,  6 Aug 2023 21:58:28 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:58:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806235827.72278412@windsurf>
In-Reply-To: <20230805215212.3637412-1-bernd@kuhls.net>
References: <20230805215212.3637412-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691359109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbsRuDOFRMhwPnxAUE2otJV86OFOaH00SRb6jb8Hgzc=;
 b=BVHzGDneW40iW7c493/GLcMFLMS/hBPID1in9B/W5yflgJV4xIzjQRwggqd7ysDIla76Za
 RJAXD7yDyxDr6G3Y3F8ucFGZ9sPz944eNBYDhoGqj5uXvebWb0yEt+8YM50POTp0pe4SEU
 KieLwX9rmD8IuMQWEQBy1cUZrLybMU8soOtzQ1+XDvEdpAdjK988PLPd/g1Wa/kp9uGNE2
 DxndV4qFCBDdJSnbEHLzay2JyRvK83WXCwwAkxvIiIEH5GVj4C+vWOF6owin/hyposgctT
 k123HPxGDYPujTY23TebY4lEM17OQhUmjDaDSLFrspRnH5rQIr3rBsUJZOC3Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BVHzGDne
Subject: Re: [Buildroot] [PATCH 1/4] package/ranger: switch from distutils
 to setuptools
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Thijs Vermeir <thijsvermeir@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Aug 2023 23:52:09 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> distutils will be dropped with python 3.12.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ranger/ranger.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
