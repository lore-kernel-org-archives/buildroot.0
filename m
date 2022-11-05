Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9649C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CF9D40467;
	Sat,  5 Nov 2022 22:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF9D40467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpJMeelVUQLP; Sat,  5 Nov 2022 22:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D8F40153;
	Sat,  5 Nov 2022 22:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D8F40153
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 083B01BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D812381285
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D812381285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCXZhE-veAfI for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:49:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B3D81095
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3B3D81095
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:49:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E05C60009;
 Sat,  5 Nov 2022 22:49:43 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:49:42 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221105234942.6bdac7cb@windsurf>
In-Reply-To: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667688584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPOPw/8PxyFaG4lqyGWNe17LH44tdYrIlZIKQXNPcrI=;
 b=BNZfqCMU0LpojSVrw5VRHYXaGIAAOSq4uUwfdb9iO92+EQE42Zs1cNP1E7tIGPshOBdg52
 W2IHd4A0gPGcK3nf1IZVPeljwrlZ4yCZyHfTXma1NVtMoSfH7ntmJSVuVdl/Nje+TOdKGU
 5rDHCfxJoUFnkUGik2lB/X3v2YAVuOqHVVUfeuxXw0Gfyb6SMalAKmWUNoKnUxjewG+Mkv
 6JKLShcU2+7T94KbsEHwYa5tZ5/1Z0bLp2xMgUr4Lwg02gX5A7r7XziumSl3QXYJVeqm9i
 RF6kuEn161pHmgsW85mKONun0GSKRxPAFpp+UVN+wZ2Ue4Tku4fMz4FcPwOfHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BNZfqCMU
Subject: Re: [Buildroot] [PATCH 1/3] package/socat: fix printf feature
 detection
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 09:41:54 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> socal configure uses AC_TRY_RUN to detect printf features. This does not
> work for cross compilation.
> 
> All C libraries we use support C99 snprintf. Only glibc and uClibc
> support the deprecated Z modifier.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/socat/socat.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

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
