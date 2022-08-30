Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CB5ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72266103D;
	Tue, 30 Aug 2022 16:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72266103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJ21dbzWQrfV; Tue, 30 Aug 2022 16:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AC960FF3;
	Tue, 30 Aug 2022 16:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26AC960FF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 589581BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC5A840BAB
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC5A840BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jK2ys8XVdpK for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA588400CB
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA588400CB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 333DC88096; Tue, 30 Aug 2022 15:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 17:59:43 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 2a7a38573b6572d96c0282cb7f30b3e779e3713b
X-Git-Newrev: 6d5d5c0693fd72a7585ffb25ef6e0cc89e45b327
X-Patchwork-Hint: ignore
Message-Id: <20220830155958.333DC88096@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/sconeserver: add
 sqlite optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d5d5c0693fd72a7585ffb25ef6e0cc89e45b327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

sqlite is an optional dependency which is enabled by default since
https://github.com/sconemad/sconeserver/commit/4120395991c2c63abef58426beee4ecf5879c204

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 117b15866a1d1b87adc87b95768f2a0a62b13905)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in      | 6 ++++++
 package/sconeserver/sconeserver.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 4ade8b4590..eed777ae96 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -76,6 +76,12 @@ config BR2_PACKAGE_SCONESERVER_RSS
 	help
 	  RSS module for Sconeserver
 
+config BR2_PACKAGE_SCONESERVER_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  SQLite module for Sconeserver
+
 config BR2_PACKAGE_SCONESERVER_TESTBUILDER
 	bool "testbuilder"
 	help
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index bad050210e..fd7e6774eb 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -91,6 +91,13 @@ else
 SCONESERVER_CONF_OPTS += --without-rss
 endif
 
+ifeq ($(BR2_PACKAGE_SCONESERVER_SQLITE),y)
+SCONESERVER_DEPENDENCIES += sqlite
+SCONESERVER_CONF_OPTS += --with-sqlite
+else
+SCONESERVER_CONF_OPTS += --without-sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
 SCONESERVER_CONF_OPTS += --with-testbuilder
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
