Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92560C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F009060F7F;
	Sat,  6 Aug 2022 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F009060F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg4oAa_pb2_K; Sat,  6 Aug 2022 21:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04EDF6074C;
	Sat,  6 Aug 2022 21:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04EDF6074C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB3871BF95E
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96D11417D6
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D11417D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDiBlXIUNJn1 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:23:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84095417D4
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84095417D4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD3DA86D1A; Sat,  6 Aug 2022 21:08:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 23:22:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6241bc2ca335a405f1ccf387d5d77ad141277a2
X-Git-Newrev: 2c6d007fc0c165d9da3bc39b48d2f2b07ce0aaf0
X-Patchwork-Hint: ignore
Message-Id: <20220806210853.AD3DA86D1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lshw: reformat
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c6d007fc0c165d9da3bc39b48d2f2b07ce0aaf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lshw was introduced in early 2012, and since then our coding standards
have evolved substancially, and so lshw is lagging way behind nowadays.

Reformat it with the current styles:
  - mandatory dependencies go before build variables
  - one item per line in multi-line assignments
  - space after the last item in a multi-line assignment
  - don't hard-code the build target 'all' in the common make opts
  - split long command lines
  - format build and install command lines similarly for ease of
    comparison

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lshw/lshw.mk | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 9f1ff8938a..45b22e88e3 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -10,20 +10,29 @@ LSHW_SOURCE = lshw-B.$(LSHW_VERSION).tar.gz
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
-LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
-	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
+LSHW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+
+LSHW_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	AR="$(TARGET_AR)" \
+	RPM_OPT_FLAGS="$(TARGET_CFLAGS)"
+
 LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	LIBS=$(TARGET_NLS_LIBS)
-LSHW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 define LSHW_BUILD_CMDS
-	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPTS)
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
+		$(LSHW_MAKE_OPTS) \
+		all
 endef
 
 define LSHW_INSTALL_TARGET_CMDS
-	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
-		$(LSHW_MAKE_OPTS) install
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
+		$(LSHW_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
 	$(RM) -rf $(TARGET_DIR)/usr/share/lshw
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
