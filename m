Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF00C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E15613EA;
	Sun,  7 May 2023 16:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E15613EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tMl7_XZbhze; Sun,  7 May 2023 16:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA94960D79;
	Sun,  7 May 2023 16:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA94960D79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41F731BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25A0C4177A
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A0C4177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFHnfBwyH8zI for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:55:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2740641778
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2740641778
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BE6B85FF8; Sun,  7 May 2023 16:55:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 18:54:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12bf326c258a52d6e96c9ddd2402a0bc9feb8857
X-Git-Newrev: dfefdea8e5a7b368616fc7733022c23a475b215f
X-Patchwork-Hint: ignore
Message-Id: <20230507165556.0BE6B85FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: regenerate list
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfefdea8e5a7b368616fc7733022c23a475b215f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some patches were removed in recent version bumps:
  - 80793107a65d  package/transmission: bump version to 4.0.3
  - 8d6ddb7a2905  package/rtl8812-aircrack-ng: bump to 2023-05-01
                  version to fix build failure with Linux 6.3

Update the ignore list accordingly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index cd0ccc1abd..b753e1ecfc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1415,7 +1415,6 @@ package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.p
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch Upstream
 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch Upstream
 package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch Upstream
-package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch Upstream
 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch Upstream
 package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch Upstream
 package/rtmpdump/0001-include-limits.h.patch Upstream
@@ -1569,9 +1568,6 @@ package/tor/0003-patch-src_lib_tls_x509_openssl_c.patch Upstream
 package/tovid/0001-manpage.patch Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch Upstream
-package/transmission/0001-fix-utypes.patch Upstream
-package/transmission/0002-fix-utp-include.patch Upstream
-package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch Upstream
 package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
 package/triggerhappy/S10triggerhappy Indent Shellcheck Variables
 package/trinity/0001-Fix-build-with-GCC-10.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
