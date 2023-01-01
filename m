Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91603C4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465A88140B;
	Sun,  1 Jan 2023 18:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465A88140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id St73BVodCznI; Sun,  1 Jan 2023 18:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98ADB81403;
	Sun,  1 Jan 2023 18:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98ADB81403
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32ED91BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A16D60AD5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A16D60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CprfWy1_x7U2 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F6726080A
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6726080A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C5FC87026; Sun,  1 Jan 2023 18:19:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 19:13:10 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 99a9b223775f56a227cfb755d9472571adf2124e
X-Git-Newrev: 430e8ff12592bf5d630cd92bfdb4c4850ffa0e34
X-Patchwork-Hint: ignore
Message-Id: <20230101181932.1C5FC87026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libdeflate: fix
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=430e8ff12592bf5d630cd92bfdb4c4850ffa0e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following static build failure raised since bump to version 1.15
in commit c31087182fa545784d9a0a01f0b32715d78c3955:

[ 79%] Linking C shared library libdeflate.so
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/25489e5c6f0da642136e099ab35b091624f53a2b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 08049e9f522c0fee6ff05b7358b1f1689f4e53c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdeflate/libdeflate.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 2305af4dc9..67e97c6e5e 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -12,4 +12,18 @@ LIBDEFLATE_INSTALL_STAGING = YES
 LIBDEFLATE_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE"
 
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=OFF
+else ifeq ($(BR2_STATIC_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=OFF \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
