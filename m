Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53758C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 21:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74B2820EA;
	Mon, 30 Oct 2023 21:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E74B2820EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srSCiKkEE3Rg; Mon, 30 Oct 2023 21:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F32C820B4;
	Mon, 30 Oct 2023 21:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F32C820B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6D911BF34E
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1340820B4
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 21:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1340820B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHqwfwRgFjFY for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 21:56:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F1681FF2
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 21:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F1681FF2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B339386213; Mon, 30 Oct 2023 21:56:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 22:54:07 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ef4f123ee3fb111ff4927bfc7580e4abf41a632a
X-Git-Newrev: 396c902ec9648e92308f0895c91de5e8bcf8f59f
X-Patchwork-Hint: ignore
Message-Id: <20231030215647.B339386213@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 package/x11r7/xlib_libXpm: security bump to version 3.5.17
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=396c902ec9648e92308f0895c91de5e8bcf8f59f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix CVE-2023-43788, CVE-2023-43789 and CVE-2023-43786

https://lists.x.org/archives/xorg-announce/2023-October/003424.html
https://lists.x.org/archives/xorg-announce/2023-October/003425.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c709ab6fff85285c3f44eacbe780302a29a32ede)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 6 +++---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index a041f0d440..3582169891 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003385.html
-sha256  e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51  libXpm-3.5.16.tar.xz
-sha512  ee564311f8c1c9c08ed1035d55c287ecf7c20c6fee09ad448acfab59f38fd1ef381d4a24b4af2b581f3033730eebc7c690918e52ba706de689d1ef11085edac2  libXpm-3.5.16.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003425.html
+sha256  64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43  libXpm-3.5.17.tar.xz
+sha512  52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e  libXpm-3.5.17.tar.xz
 # Locally calculated
 sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 51f6283370..0bba3ea946 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.16
+XLIB_LIBXPM_VERSION = 3.5.17
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
