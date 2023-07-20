Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9442CEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C48F60A64;
	Thu, 20 Jul 2023 21:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C48F60A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPOX45L2-I3D; Thu, 20 Jul 2023 21:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A83E612B9;
	Thu, 20 Jul 2023 21:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A83E612B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A051BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE8B404FE
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE8B404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_lZLPa7moBR for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:19:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D27EA4049D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27EA4049D
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA4BC40002;
 Thu, 20 Jul 2023 21:19:25 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:19:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720231924.3523c264@windsurf>
In-Reply-To: <20230720202829.2568063-1-bernd@kuhls.net>
References: <20230720202829.2568063-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689887966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHF7gGMENkcIhqErRiNiX1GJnBca0zs0BfgvCbWn2II=;
 b=p5rO78rInKA3i/tUkmzmtNzw9PKNQw0aODN9ku/aQfFBpcadIZ9LL75Orld1sHPseP1x2u
 rBwfuKJoB6hZo2WXjwWl/sSsrEuzQ8/RgogAWpk2qCp9C+LfVR8/2EuDLtFu0VDNSurnCJ
 ZKoM8tYmNUDPTFvos9XQaAz9EG4Bpl4+pRL1IkKyCRTQA39eHbNubN6mRLndDaWKDX139h
 ojzUxM9OAvqqSD+yXEtbGdLn+K3G4QBs9BTqI8exWQ6qAmfN1gdc+kepQbyWPTwEgP4P4d
 61/8/hl4UtgSC9cRJM2rObC8JzpzM/nBE70GUI09Jd2mdIBwt7ystM1dvEgL2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p5rO78rI
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: fix comment
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jul 2023 22:28:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libuhttpd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Indeed, well spotted. Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
