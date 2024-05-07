Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4523EC19F4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A582282433;
	Tue,  7 May 2024 20:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MviSAgj5ZUFg; Tue,  7 May 2024 20:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC9182103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC9182103;
	Tue,  7 May 2024 20:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14A5E1BF281
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA51582410
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHitPjZA0lOq for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8056582456
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8056582456
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9423D86A48; Tue,  7 May 2024 20:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 22:13:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e83045c4822072698bcfc6580707c2f2e70331ad
X-Git-Newrev: f357412f131a3200695aa8c8acfcba5b5a3e4f14
X-Patchwork-Hint: ignore
Message-Id: <20240507201522.9423D86A48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/tinycbor:
 override prefix at build time as well
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

commit: https://git.buildroot.net/buildroot/commit/?id=f357412f131a3200695aa8c8acfcba5b5a3e4f14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

To ensure the correct prefix is used in the generated tinycbor.pc instead of
/usr/local:

>>> tinycbor 0.6.0 Building
..
sed > tinycbor.pc < tinycbor.pc.in \
        -e 's,@prefix@,/usr/local,' \
        -e 's,@exec_prefix@,/usr/local,' \
        -e 's,@libdir@,/usr/local/lib,' \
        -e 's,@includedir@,/usr/local/include,' \
        -e 's,@version@,0.6.0,'
>>> tinycbor 0.6.0 Installing to staging directory
..
install -m 644 tinycbor.pc /path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/tinycbor.pc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b059e084201108255db61a27824d4bb8159d1054)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinycbor/tinycbor.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index cad50e633b..d2fb583e67 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
 
-TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1
+TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1 prefix=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
@@ -34,12 +34,12 @@ endef
 
 define TINYCBOR_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) prefix=/usr install
+		DESTDIR=$(STAGING_DIR) install
 endef
 
 define TINYCBOR_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr install
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
