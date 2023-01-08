Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB95C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32194F3BD;
	Tue, 21 Feb 2023 00:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32194F3BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KO2YaSjLbUU9; Tue, 21 Feb 2023 00:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3394F3BA;
	Tue, 21 Feb 2023 00:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E3394F3BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB1691BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 918BA6FABC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918BA6FABC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ivi9kENDhe4N for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3A76FB24
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3A76FB24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B5C68648F; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 22:13:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d0ecb9b2803b5b0b293acd7a5a6bba1ed1e3feab
X-Git-Newrev: 359205b4f5b151a6ddff93cd75fd569a6f5c54b4
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.9B5C68648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hiredis: enable host
 package
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
Content-Type: multipart/mixed; boundary="===============2399009046849475872=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2399009046849475872==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=359205b4f5b151a6ddff93cd75fd569a6f5c54b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-hiredis package is needed for the upcoming ccache update.
So, being a dependency of ccache, we can't use ccache, so we must unset
the options set by the cmake infra (this will be true only when we
eventually bump ccache, but hiredis builds very fast even without ccache
so we don't care about ccache even now).

Reorder CONF_OPTS assignments so that comments apply equally to the host
and target variants.

Cc: Dominik Michael Rauh <dmrauh@posteo.de>
Cc: Anders F Björklund <anders.f.bjorklund@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - add Dominik and Anders in Cc to ack they provided inspiration
  - use -Ufoo instead of -Dfoo=""  (as per Dominik & Anders)
  - reorder CONF_OPTS assignments
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hiredis/hiredis.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f79b6c757a..a2f7627b58 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -11,9 +11,14 @@ HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
+
+HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
+HOST_HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
+
 # Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
-# resulting in a build failure with collectd
-HIREDIS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -DDISABLE_TESTS=ON
+# resulting in build failures when linking.
+HIREDIS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+HOST_HIREDIS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
@@ -22,4 +27,11 @@ else
 HIREDIS_CONF_OPTS += -DENABLE_SSL=OFF
 endif
 
+# We may be a ccache dependency, so we can't use ccache; reset the
+# options set by the cmake infra.
+HOST_HIREDIS_CONF_OPTS += \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))

--===============2399009046849475872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2399009046849475872==--
