Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF9C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDEA481BB4;
	Wed, 27 Jul 2022 10:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDEA481BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXzA5DMh5zLi; Wed, 27 Jul 2022 10:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AC181B9A;
	Wed, 27 Jul 2022 10:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AC181B9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1631BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D9480BD4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D9480BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7_fFsP3tHPM for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:48:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44B9280BBD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B9280BBD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 61AB1865BE; Wed, 27 Jul 2022 10:34:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:14:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49b8fad29c65971f97bb81a7b7c4a1fda7276df4
X-Git-Newrev: 117b15866a1d1b87adc87b95768f2a0a62b13905
X-Patchwork-Hint: ignore
Message-Id: <20220727103457.61AB1865BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sconeserver: add sqlite optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=117b15866a1d1b87adc87b95768f2a0a62b13905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sqlite is an optional dependency which is enabled by default since
https://github.com/sconemad/sconeserver/commit/4120395991c2c63abef58426beee4ecf5879c204

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
