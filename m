Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FF3C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30AEF811D2;
	Fri,  7 Aug 2026 09:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXksuVHZfnK8; Fri,  7 Aug 2026 09:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BAE2811F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095229;
	bh=icJbZro5mAxOOySbzFTrc/AHM19jSITIPCVmDjSeGM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S/m5NW+PF++yGaDuTK4NL34wIYAqUZyvdIEiVr3IrsoSVnsNr+x9gMz1zkk8Peiwx
	 98o6YPOflxY6IW89WX51AejdCCxgr6G8BbAxTt9yMu15TUC0zSfVcDBVsaamD80Xsp
	 /yVnPogVRCjGU1xmyb6hrWho+eGXY6RGoUBgh5lMT8I0iozETADYaj/o49POsu6ipm
	 hzjwnC8fsZD++xclXRpSAxjI900LotYqRCu7xYFs0EtvYYJPaHbNIiiLbyxfuhMNfL
	 eZitoW2lFXU1daPET+4jy5NzXyB+4Rhrxnfa8E9TBIQcCfY5pNLfoa1PtGrY+kN4pA
	 eJ9SicG57e+bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAE2811F0;
	Fri,  7 Aug 2026 09:33:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8158D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE43140313
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtIV_62tdNLG for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE9CA4019B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE9CA4019B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45E098CA43; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a29a996531b0839383c1b349472e9bdb3864e2b4
X-Git-Newrev: 372ec7417e2a96679c27d8a2c9c76036d6a33991
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.45E098CA43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmicrohttpd:
 bump to version 1.0.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/372ec7417e2a96679c27d8a2c9c76036d6a33991
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changelog since 1.0.5:

Fix various minor issues, like theoretical
integer overflows for extreme inputs or NULL
dereferences if the application passes NULL
where it should not.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6d8a1bb4c845159fd174661055cf9113fcd62a97)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 4dfe62deeb..90b598f9a5 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2  libmicrohttpd-1.0.5.tar.gz
+sha256  bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70  libmicrohttpd-1.0.6.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a3b24d363c..6e7c79ee88 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.5
+LIBMICROHTTPD_VERSION = 1.0.6
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
