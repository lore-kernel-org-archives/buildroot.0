Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63038C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EB360A9A;
	Sat, 13 Jan 2024 20:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EB360A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkVbde0bvADm; Sat, 13 Jan 2024 20:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5672160F12;
	Sat, 13 Jan 2024 20:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5672160F12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DD061BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 595F74097A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 595F74097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0X_rvwFIlIlN for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A132140960
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A132140960
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90AE681E7F; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 16:09:39 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 28949d6684f9215af1e8b8c88df235ee3d1a4960
X-Git-Newrev: 2f7926e2edb7f59413cb017e4e4feb465467ac1d
X-Patchwork-Hint: ignore
Message-Id: <20240113203307.90AE681E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/exim: fix build
 with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f7926e2edb7f59413cb017e4e4feb465467ac1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Upstream added optional support for execinfo

https://git.exim.org/exim.git/commitdiff/204a7a2c2e8601558905dc34c576a627045a9f21
https://git.exim.org/exim.git/commitdiff/48ea675fee2d5fee8d33c525e28727b69114cfce

in version 4.97 which was added to buildroot with commit
faec3ca30e358575f70a036879029f63f7da9b29

Fixes:
http://autobuild.buildroot.net/results/282/282882371e1d8c224c457bf65016f8abd11f8c45/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22b629729667bac6aa3a9c5079be4487bb850d23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index fb9eecd71b..98b6097957 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -103,6 +103,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
+	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
 endef
 
@@ -126,6 +127,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+EXIM_DEPENDENCIES += libexecinfo
+EXIM_EXTRALIBS += -lexecinfo
+else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+EXIM_CFLAGS = -DNO_EXECINFO
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
@@ -136,7 +144,7 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_CFLAGS)"
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
