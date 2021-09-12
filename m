Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B95BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:01:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D346061209
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D346061209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A50EB8277E;
	Sun, 12 Sep 2021 12:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne0PHGzhd7WW; Sun, 12 Sep 2021 12:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1572881AA7;
	Sun, 12 Sep 2021 12:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE2851BF956
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADAA060BDD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJdAaQb2vtok for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1801A60BDB
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D6C438A3E5; Sun, 12 Sep 2021 11:59:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 13:57:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8654c8d80e06a1dc57590ada0fab48fb0445fffd
X-Git-Newrev: 3edc1cc44c7bd2deed31d28fa9534e67f32334e8
X-Patchwork-Hint: ignore
Message-Id: <20210912115914.D6C438A3E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add option to build
 examples
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3edc1cc44c7bd2deed31d28fa9534e67f32334e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/Config.in   | 5 +++++
 package/pipewire/pipewire.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 6c61dd2021..b15bbfa8d3 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -14,6 +14,11 @@ config BR2_PACKAGE_PIPEWIRE
 
 if BR2_PACKAGE_PIPEWIRE
 
+config BR2_PACKAGE_PIPEWIRE_EXAMPLES
+	bool "pipewire examples"
+	help
+	  Build pipewire examples
+
 config BR2_PACKAGE_PIPEWIRE_GSTREAMER
 	bool "pipewire gstreamer plugins"
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 9259f0421f..e4ea60c39c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -14,7 +14,6 @@ PIPEWIRE_DEPENDENCIES = host-pkgconf dbus $(TARGET_NLS_DEPENDENCIES)
 
 PIPEWIRE_CONF_OPTS += \
 	-Ddocs=disabled \
-	-Dexamples=disabled \
 	-Dman=disabled \
 	-Dtests=disabled \
 	-Dspa-plugins=enabled \
@@ -36,6 +35,12 @@ else
 PIPEWIRE_CONF_OPTS += -Dudev=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE_EXAMPLES),y)
+PIPEWIRE_CONF_OPTS += -Dexamples=enabled
+else
+PIPEWIRE_CONF_OPTS += -Dexamples=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
 PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
 PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
