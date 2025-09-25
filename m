Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8395ACAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4C261608;
	Thu, 25 Sep 2025 20:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDPLP1R-mTTw; Thu, 25 Sep 2025 20:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2632E615D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2632E615D9;
	Thu, 25 Sep 2025 20:30:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6C512D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A0E4161D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULKlnXBqEVcX for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE5C415F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE5C415F6
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDD4B83B7E; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:41:47 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 9cd0b8a4f8f7b1aab90c024680ef35acd498dd05
X-Git-Newrev: f5d88700ecde8767f59fcad79c81cde06f438e6b
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.BDD4B83B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/c-icap-modules:
 fix build with GCC 15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f5d88700ecde8767f59fcad79c81cde06f438e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Add a patch fixing prototype issues with GCC 15.x. The patch cannot be
submitted upstream because the problematic code has completely changed
in newer releases.

No autobuilder failures because they were hidden by 'c-icap' not
building with GCC 15.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2febca71f78fc45805b7b004339cc2d83fdc5e28)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...x-module-function-prototypes-for-GCC-15.x.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch b/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
new file mode 100644
index 0000000000..c0886d3c0e
--- /dev/null
+++ b/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
@@ -0,0 +1,59 @@
+From 5cc2e2764588fc5025e1ba7e07361d50659bb06a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 7 Sep 2025 17:58:00 +0200
+Subject: [PATCH] Fix module function prototypes for GCC 15.x
+
+Upstream: N/A, upstream has completely changed how modules work
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ services/virus_scan/clamav_mod.c | 4 ++--
+ services/virus_scan/clamd_mod.c  | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/services/virus_scan/clamav_mod.c b/services/virus_scan/clamav_mod.c
+index a138006..ee26ce6 100644
+--- a/services/virus_scan/clamav_mod.c
++++ b/services/virus_scan/clamav_mod.c
+@@ -75,7 +75,7 @@ static struct ci_conf_entry clamav_conf_variables[] = {
+ 
+ int clamav_init(struct ci_server_conf *server_conf);
+ int clamav_post_init(struct ci_server_conf *server_conf);
+-void clamav_release();
++void clamav_release(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "clamav_mod",
+@@ -273,7 +273,7 @@ int clamav_post_init(struct ci_server_conf *server_conf)
+      return CI_OK;
+ }
+ 
+-void clamav_release()
++void clamav_release(struct ci_server_conf *server_conf)
+ {
+     clamav_destroy_virusdb();
+     if (CLAMAV_TMP)
+diff --git a/services/virus_scan/clamd_mod.c b/services/virus_scan/clamd_mod.c
+index c0d2909..c522a9c 100644
+--- a/services/virus_scan/clamd_mod.c
++++ b/services/virus_scan/clamd_mod.c
+@@ -34,7 +34,7 @@ static struct ci_conf_entry clamd_conf_variables[] = {
+ 
+ int clamd_init(struct ci_server_conf *server_conf);
+ int clamd_post_init(struct ci_server_conf *server_conf);
+-void clamd_release();
++void clamd_release(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "clamd_mod",
+@@ -301,7 +301,7 @@ int clamd_post_init(struct ci_server_conf *server_conf)
+     return CI_OK;
+ }
+ 
+-void clamd_release()
++void clamd_release(struct ci_server_conf *server_conf)
+ {
+ }
+ 
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
