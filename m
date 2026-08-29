Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54086C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D396060E;
	Sat, 29 Aug 2026 21:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAv5zlGUpcDO; Sat, 29 Aug 2026 21:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788039252;
	bh=PtflrFX0VR/LYLY4oPiCasOZw0l/al8mpWQd1GEkQF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jokihO/0Jon0LRxyd/PZXkyLwq3T+hkKAnalIe2ncfXZ0iUGa/EGUbJB0obDEii7d
	 3/VnRNEtEN1oGA/HpIX6b35jhZojyIOoQI6sWzvwwj/lnw5kXwAtaP7e9ZBrOsButo
	 +Be/FVOMZ7Xc4LyimawD5y7Wk+l9wC95z8LFfl348IxDBk1vbuHXGKoZ9zRoECOkUf
	 OA+92AeVvmEP0Xlb97LZny9tESvG9jeXAc8MoJD4yPtXRF6kGR51O42Ah+x1yvmMUX
	 ZwLxPErVwCq0YhpMpEyDWiLuR/RN0vFOHguLNSdZtEOrpJDgkZqlfSRKG/uvqXy2JY
	 egeqKLf8OgFRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27DB0605EE;
	Sat, 29 Aug 2026 21:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEC16355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 951D94008C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1bOzF4-qpkx for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C69840059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:34:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D21491C83; Sat, 29 Aug 2026 21:33:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:32:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c529a2c28628e60ac51917704a0ad5e2c5fb48e7
X-Git-Newrev: e1ec936cf732e50bddb588985a8d6738b43da3ac
X-Patchwork-Hint: ignore
Message-Id: <20260829213312.5D21491C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv: fix webp dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e1ec936cf732e50bddb588985a8d6738b43da3ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When BR2_PACKAGE_OPENCV4_WITH_WEBP=y we need to enable mux and demux
support in webp, otherwise the build of OpenCV fails as follows:

    CMake Error: The following variables are used in this project,
         but they are set to NOTFOUND.
    Please set them or make sure they are set and tested correctly
         in the CMake files:
    WEBP_DEMUX_LIBRARY
    linked by target "opencv_imgcodecs"
         in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
    WEBP_MUX_LIBRARY
    linked by target "opencv_imgcodecs"
         in directory [...]/build/opencv4-4.13.0/modules/imgcodecs

The issue already exists in 2025.02.x.

Fixes:

  https://autobuild.buildroot.net/results/d3e0446a87d32469267e241866c4224143170f31/

Signed-off-by: Alessandro Rubini <rubini@gnudd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 47c1cf3f4a..e4a15f742b 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -369,6 +369,8 @@ config BR2_PACKAGE_OPENCV4_WITH_V4L
 config BR2_PACKAGE_OPENCV4_WITH_WEBP
 	bool "webp support"
 	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	help
 	  Enable WebP support.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
