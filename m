Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AFAC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991DB701BB;
	Tue, 21 Feb 2023 01:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991DB701BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iO2S15WCUzUz; Tue, 21 Feb 2023 01:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A32701E0;
	Tue, 21 Feb 2023 01:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A32701E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46A161BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5B137002C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B137002C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXXZ9VlN3GKM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1988C70000
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1988C70000
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B25F828C8; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:34:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d40cab45e21cd1c66bfffa911b1310e29c321486
X-Git-Newrev: 4706e04e3ca7428c755bffd79ddf8ef8628141e0
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.0B25F828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsolv: drop
 unrecognized variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=4706e04e3ca7428c755bffd79ddf8ef8628141e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop unrecognized variables:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_CXX_COMPILER_FORCED
    DISABLE_STATIC
    ENABLE_SHARED

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsolv/libsolv.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 29f8a6a3d2..04fdb387fd 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -11,16 +11,15 @@ LIBSOLV_LICENSE_FILES = LICENSE.BSD
 LIBSOLV_CPE_ID_VENDOR = opensuse
 LIBSOLV_INSTALL_STAGING = YES
 LIBSOLV_DEPENDENCIES = zlib
-LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
 else
-LIBSOLV_CONF_OPTS += -DDISABLE_STATIC=ON
+LIBSOLV_CONF_OPTS += -DENABLE_STATIC=OFF
 endif
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-LIBSOLV_CONF_OPTS += -DENABLE_SHARED=ON
+LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=OFF
 else
 LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
