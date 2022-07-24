Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12689C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809DF61ABA;
	Sun, 24 Jul 2022 12:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809DF61ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2ujYpBcZ5_r; Sun, 24 Jul 2022 12:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C8560F69;
	Sun, 24 Jul 2022 12:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C8560F69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02C961BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFECE84BD5
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFECE84BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUKWbENi7lMV for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2718384BD2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2718384BD2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D81A85C21; Sun, 24 Jul 2022 12:03:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:16:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8bc53e37a80fc3fdcc206293a6a6d49dc7abb9e
X-Git-Newrev: 2cbf1e4d3a1ade7acc41ed50389fba2001680b6e
X-Patchwork-Hint: ignore
Message-Id: <20220724120300.0D81A85C21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: convert to use the
 python-package infrastructure
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cbf1e4d3a1ade7acc41ed50389fba2001680b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-orjson/python-orjson.mk | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index cfcaedc280..3a0ab937d4 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -6,17 +6,16 @@
 
 PYTHON_ORJSON_VERSION = 3.6.8
 PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
+PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
-PYTHON_ORJSON_CARGO_ENV = \
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
+PYTHON_ORJSON_ENV = \
+	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
 
-# orjson uses "maturin" to generate distribution packages - rather than teach
-# buildroot how to understand this, we reach in and install directly.
-define PYTHON_ORJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
-endef
-
-$(eval $(cargo-package))
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
