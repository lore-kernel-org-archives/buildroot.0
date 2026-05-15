Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28999CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D3C7845C0;
	Fri, 15 May 2026 17:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6rZnXsmCG6G; Fri, 15 May 2026 17:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B9484598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867122;
	bh=CD8UIRpH4DSzRfZz4ZlRT2ZJrmuwAp8Zq1qGMV4BsuY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BBHGirFfX18WmrNcqEZwscQKIpRSZhWJPHs2HGJoLUwk7Karsck7uRGoQ2HaOknOg
	 bfTqEJX44o8D7A38w3Sg2KhUolDMLNd5R0TDb1/3ZDAAZ7qdkyUVzP2G6obk2oholg
	 b4n5tbIiejAlG4rdQA9nzjoYwHxL6lwAOboWQNsspLyPFl1X4vxyhyvka2iQYLnbO2
	 mvliFtZPoS7aZl66UEGCuGqrJpGt//hbMTx5PRBtTHrolRNpBtfajf+I+a7M94Yv8M
	 60E18tLS4MPi1uLOGppv3NISMUxT1ek78vl3vO13IhkS3a27MqHujDN+2xm2no0826
	 WrTLhcBpYFDag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B9484598;
	Fri, 15 May 2026 17:45:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12BA923F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A398418C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MEDCrhUIqSW for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9178184191
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9178184191
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0A228639C; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4e40da14f466dee0dc7759ca457ea51b61debcf4
X-Git-Newrev: b28897a5fdfaae83b6acd9aaf0363b4e70bbbe14
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.D0A228639C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xlib_libXpm:
 security bump to version 3.5.19
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b28897a5fdfaae83b6acd9aaf0363b4e70bbbe14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

CVE-2026-4367: libXpm Out-of-bounds read in xpmNextWord()

libXpm uses a number of internal helper functions to parse the XPM file
format.
One of these internal functions, xpmNextString(), checks for the NULL
terminator when looking for the end of the current string but not when
looking for the beginning of the next string.
A small XPM file with a malformed color table definition may cause the
function xpmNextWord(), called from xpmParseColors() following a call to
xpmNextString(), to start past the actual end of the file, causing an
out-of-bound read.

Advisory:
https://lists.x.org/archives/xorg-announce/2026-April/003690.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3aa75c99c13caf0816c69f57245c2950d40f3895)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 6 +++---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index 3582169891..72a330f1ad 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003425.html
-sha256  64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43  libXpm-3.5.17.tar.xz
-sha512  52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e  libXpm-3.5.17.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003691.html
+sha256  ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900  libXpm-3.5.19.tar.xz
+sha512  dd95a70af0ac2fb0f5876e69ad19b38128c5add94b00238ee41a22634aa4dc56b22c1b47c4baa6a1ab549308d11b302c250b405322da8a64ea24441a065fbada  libXpm-3.5.19.tar.xz
 # Locally calculated
 sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 1239ba0d4d..a2a652df17 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.17
+XLIB_LIBXPM_VERSION = 3.5.19
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
