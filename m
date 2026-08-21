Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED2C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 10:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60D860677;
	Fri, 21 Aug 2026 10:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVOds4pfo2TK; Fri, 21 Aug 2026 10:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787308103;
	bh=519QsSQMktUC6SxTl0As9at2U75Y9FPWhcBphHTjP+M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EE9navnhndk6wtilm8BamNjRQqZ1ooeURtBie1AuTVCkmXL9GHVWVNv5P9yQggqWK
	 vMdJ0fPhaOpknUSdIPoURyjFvFf6GeMCMsKbC7IyGOlszEKN6oVfltVQO5pKT7DaTC
	 RLbvmTuCUnDpF+917OS7psyDjdC7rMGwR9ZCI08dm8It5BQaHAWRv1W9MR++DDq6ku
	 z5Y0XnEOV37Ri+zoELOUleCieplLYITT/MkhqNI1FoAFaNEnK4/aci5NwvEhFXttxu
	 f7ci4Xv96AsCTiehRC1d54KYY9uqBKJTBM+oIhWtZMHWgCf1HvlB4r3ZTjHRfQv50B
	 oTU87s6GDcvxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C296068A;
	Fri, 21 Aug 2026 10:28:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20DD4EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1125080F52
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptiPNXLpRIKI for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 10:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE6380F24
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:28:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 76A044E412FD
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:28:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A93D604AA;
 Fri, 21 Aug 2026 10:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78E0D11C76ED9; 
 Fri, 21 Aug 2026 12:28:12 +0200 (CEST)
Date: Fri, 21 Aug 2026 12:28:11 +0200
To: Alessandro Rubini <rubini@gnudd.com>
Cc: buildroot@buildroot.org
Message-ID: <aognldAvgHC81hyu@windsurf>
References: <amaDQ/RxzLn24+me@arcana.i.gnudd.com> <aoglkraRzHufPBHQ@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoglkraRzHufPBHQ@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/opencv: depend on webp mux/demux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 21, 2026 at 12:23:03PM +0200, Thomas Petazzoni wrote:
> In the autobuilders, I see that the few occurrences of this failures
> occur when BR2_PACKAGE_OPENCV4_WITH_WEBP is enabled, which pulls in
> webp as a dependency already.

Ah, I can indeed reproduce the problem with:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_OPENCV4=y
BR2_PACKAGE_OPENCV4_WITH_WEBP=y

but in this case, webp is already added as a dependency of opencv4. So
your patch is not actually correct.

What I guess happens is that we build webp without demux/mux support,
so we're missing features. So I believe the correct fix is probably:

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 47c1cf3f4a..e4a15f742b 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -369,6 +369,8 @@ config BR2_PACKAGE_OPENCV4_WITH_V4L
 config BR2_PACKAGE_OPENCV4_WITH_WEBP
        bool "webp support"
        select BR2_PACKAGE_WEBP
+       select BR2_PACKAGE_WEBP_DEMUX
+       select BR2_PACKAGE_WEBP_MUX
        help
          Enable WebP support.
 
Remains to figure out since when this problem occurs. The 4.12.0 ->
4.13.0 bump of opencv4 in commit
33178c538541be224e49b5f548bd5404de3912fa ? But this one has been
around for quite a while.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
