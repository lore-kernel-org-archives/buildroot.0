Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D245D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B1360E22;
	Tue, 13 Jan 2026 20:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OIbbTKIrwBi; Tue, 13 Jan 2026 20:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBBD60DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337961;
	bh=qmExRJXVq2mSAfmdwz+zhzHl1JldGWlg8A6YQYdERfU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iOXU836gjnylR5EZqLEzMVu80WpMvbmFqVzpkvbNJ6eq45Shj6WEQFTjzKDEp3E/P
	 wd8hpnzPr/rBrBTolrxsFLUNtqK+0jUE/UofO0Q1ALgtElSKHRAGoaMngD7kNJuh5X
	 BaArDYg69mxYWim+ekoCaQ+/fx1sd9oDzwDCA1AFrHsB4xzYkq0fxfMNz1CJ0WUi/H
	 fReblXhtvYpzNTNbc4Fspb6++ikZU/cLJG4tEXkIicuhdIosGiTEidAvGlwGjAClXT
	 2abQUese0FYfl9mI4aQ1FxMp4ExuhsLSS0ngvUgvTIz3uMOIKLgokXWOzuVDTIrxIF
	 qkUVmvo2bvs6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBBD60DFE;
	Tue, 13 Jan 2026 20:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27E7C1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF018407B8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hh06faCbyXKt for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF7940783
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DF7940783
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C3F384685; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66fe5be31aa4f57afbd6d7f215a21f4a7052eef1
X-Git-Newrev: 59754eb13f563b4bf59cbacbb6510ec604845b5c
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.4C3F384685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcursorgen: bump
 version to 1.0.9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59754eb13f563b4bf59cbacbb6510ec604845b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-May/003605.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash | 6 +++---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index 45bff55ed2..50d65d6c2a 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003264.html
-sha256  32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b  xcursorgen-1.0.8.tar.xz
-sha512  dede5b9e1e09f9253365bbb83fdab26c681641913f3586cef52d4802db9cecc7e252344911cd969a873c3a5c5ebbd4b862f786de263f92ea1bcb2df90236f9c4  xcursorgen-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003605.html
+sha256  0cc9e156ac84ca16ea902710af35e0faffa51d13797071e3b4b6cc7cbd493bbc  xcursorgen-1.0.9.tar.xz
+sha512  d40b96d6f60ee3815ef8ed6217028b39b127f200415661e39cf23af89662aafc6783f9e311f8021fe1a5ccfbc47610909796e569991e6680b8c2133401af476e  xcursorgen-1.0.9.tar.xz
 # Locally computed
 sha256  8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 318cd562db..e262001837 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.8
+XAPP_XCURSORGEN_VERSION = 1.0.9
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.xz
 XAPP_XCURSORGEN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
