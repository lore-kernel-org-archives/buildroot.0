Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E4ACD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2228840893;
	Sun,  7 Apr 2024 15:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRq1t-L3aWS6; Sun,  7 Apr 2024 15:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 229AF4089C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 229AF4089C;
	Sun,  7 Apr 2024 15:46:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA68F1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66CD2608B7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psP_CshPL0Rd for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D37960A64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D37960A64
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:46:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8133F814DE; Sun,  7 Apr 2024 15:46:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:46:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 740dffc6a81b5c99a15864885526d628d6b02efb
X-Git-Newrev: 0af98ea2d889dd63bc6934236a625732ce28b059
X-Patchwork-Hint: ignore
Message-Id: <20240407154633.8133F814DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oatpp: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=0af98ea2d889dd63bc6934236a625732ce28b059
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit d5bba26801b352f591451cf73e0b7509de0e6850:

[100%] Linking CXX executable oatppAllTests
/home/buildroot/instance-0/output-1/per-package/oatpp/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: cannot find -latomic: No such file or directory

Fixes: d5bba26801b352f591451cf73e0b7509de0e6850
 - http://autobuild.buildroot.org/results/1587b391baecdbb5a24a0c0b2c33d63cb71a2f7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/oatpp/oatpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
index c8b0c9694a..d3f6e1a9c2 100644
--- a/package/oatpp/oatpp.mk
+++ b/package/oatpp/oatpp.mk
@@ -8,7 +8,7 @@ OATPP_VERSION = 1.3.0
 OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
 OATPP_LICENSE = Apache-2.0
 OATPP_LICENSE_FILES = LICENSE
-OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF -DOATPP_BUILD_TESTS=OFF
 OATPP_INSTALL_STAGING = YES
 # Only builds a static lib and headers
 OATPP_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
