Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E95CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 08:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115A580D1B;
	Wed, 26 Oct 2022 08:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 115A580D1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8L-C8a18ctP; Wed, 26 Oct 2022 08:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3440980CEA;
	Wed, 26 Oct 2022 08:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3440980CEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 669961BF8B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D654020C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D654020C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUytoCm9Sc1g for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 08:56:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10ADB40085
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 08:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10ADB40085
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0545870EC; Wed, 26 Oct 2022 08:56:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 10:55:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd35c0f363c3192d70b111baba14b40370a206d7
X-Git-Newrev: 7983d366849527f7de3478e7dcda7cc1a0ba2e1c
X-Patchwork-Hint: ignore
Message-Id: <20221026085650.F0545870EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpid: bump to version 2.0.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=7983d366849527f7de3478e7dcda7cc1a0ba2e1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (source code was merged with
https://sourceforge.net/p/acpid2/code/ci/d0a058548d66fca8ae69438cd73ba8b00b6315b3
and moved with
https://sourceforge.net/p/acpid2/code/ci/5ec0bfe959b5e04f2af814b7377c34635fd86f6d)

https://sourceforge.net/p/acpid2/code/ci/2.0.34/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/0002-add-missing-defines.patch | 40 ----------------------------
 package/acpid/acpid.hash                     |  6 ++---
 package/acpid/acpid.mk                       |  2 +-
 3 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/package/acpid/0002-add-missing-defines.patch b/package/acpid/0002-add-missing-defines.patch
deleted file mode 100644
index a85315911f..0000000000
--- a/package/acpid/0002-add-missing-defines.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Add missing MSG_CMSG_CLOEXEC
-
-Unpatched uClibc toolchains, even using the latest 0.9.33.2, do not
-have the MSG_CMSG_CLOEXEC definition. Even though the Buildroot
-internal toolchain backend has a uClibc patch to provide it, it
-doesn't apply to external toolchains. This patch provides the
-definition of MSG_CMSG_CLOEXEC.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libnetlink.h
-===================================================================
---- a/libnetlink.h
-+++ b/libnetlink.h
-@@ -7,6 +7,10 @@
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
- 
-+#ifndef MSG_CMSG_CLOEXEC
-+#define MSG_CMSG_CLOEXEC 0x40000000
-+#endif
-+
- struct rtnl_handle
- {
- 	int			fd;
-Index: b/kacpimon/libnetlink.h
-===================================================================
---- a/kacpimon/libnetlink.h
-+++ b/kacpimon/libnetlink.h
-@@ -7,6 +7,10 @@
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
- 
-+#ifndef MSG_CMSG_CLOEXEC
-+#define MSG_CMSG_CLOEXEC 0x40000000
-+#endif
-+
- struct rtnl_handle
- {
- 	int			fd;
diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index d5e5bcc14b..8da0101264 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5  b2f2ca633b30ae893c47981fa4d3b258  acpid-2.0.33.tar.xz
-sha1  b3e06c3f2213db8ee1a9024cf372fb30e2fab637  acpid-2.0.33.tar.xz
+md5  988c2e3fd5ba0ea4492d3ba7273af295  acpid-2.0.34.tar.xz
+sha1  9322112027e4aa5a8d1b97ec64ef1d150ff0f4fc  acpid-2.0.34.tar.xz
 
 # Locally computed
-sha256  0856f71b3eb34a1b663d0a8e6363dfcbc519e63d847330498898658e2972dbe8  acpid-2.0.33.tar.xz
+sha256  2d095c8cfcbc847caec746d62cdc8d0bff1ec1bc72ef7c674c721e04da6ab333  acpid-2.0.34.tar.xz
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 5d5138baa3..4bd93068ad 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.33
+ACPID_VERSION = 2.0.34
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
