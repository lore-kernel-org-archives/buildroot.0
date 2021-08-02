Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A86C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE6761037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBE6761037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B2A8429A;
	Wed,  4 Aug 2021 01:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jt7WyoxFwLj1; Wed,  4 Aug 2021 01:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2F4844B8;
	Wed,  4 Aug 2021 01:13:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDAF21BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A72F040533
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbAAXeflVY-X for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 977F8414FE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DDDB8878C2; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 18:29:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3be90cd5b1262b992030513f7f0f6331b2364257
X-Git-Newrev: 814ebe83e766f93b748d0481f8fa7a9e4fabb767
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.DDDB8878C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/irqbalance: bump to
 version 1.8.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=814ebe83e766f93b748d0481f8fa7a9e4fabb767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop first patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/Irqbalance/irqbalance/releases/tag/v1.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...configure.ac-use-pkg-config-to-find-numa.patch} |   0
 ...001-fix-uint64_t-printf-format-use-PRIu64.patch | 105 ---------------------
 package/irqbalance/irqbalance.hash                 |   4 +-
 package/irqbalance/irqbalance.mk                   |   2 +-
 4 files changed, 3 insertions(+), 108 deletions(-)

diff --git a/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch b/package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch
similarity index 100%
rename from package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
rename to package/irqbalance/0001-configure.ac-use-pkg-config-to-find-numa.patch
diff --git a/package/irqbalance/0001-fix-uint64_t-printf-format-use-PRIu64.patch b/package/irqbalance/0001-fix-uint64_t-printf-format-use-PRIu64.patch
deleted file mode 100644
index 95a9616c71..0000000000
--- a/package/irqbalance/0001-fix-uint64_t-printf-format-use-PRIu64.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 0cdc7a22d5156440fecff14c438d4e24261ac793 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 20 Feb 2021 23:38:56 +0100
-Subject: [PATCH] fix uint64_t printf format (use PRIu64)
-
-Fixes (on arm 32-bit):
-
-  $ irqbalance-ui
-  Invalid data sent.  Unexpected token: (null)TYPE
-
-And strace showed the following:
-
-  237   sendmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="stats", iov_len=5}], msg_iovlen=1, msg_control=[{cmsg_len=24, cmsg_level=SOL_SOCKET, cmsg_type=SCM_CREDENTIALS, cmsg_data={pid=237, uid=0, gid=0}}], msg_controllen=24, msg_flags=0}, 0) = 5
-  237   recv(3, "TYPE 3 NUMBER -1 LOAD 0 SAVE_MODE 0 (null)TYPE 2 NUMBER 0 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 0 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 3 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 1 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 1 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 2 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 2 LOAD 0 SAVE_MODE 0 (null)TYPE 1 NUMBER 3 LOAD 0 SAVE_MODE 0 (null)TYPE 0 NUMBER 0 LOAD 0 SAVE_MODE 0 (null)", 8192, 0) = 411
-
-[backported from upstream]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- cputree.c    | 3 ++-
- irqbalance.c | 5 +++--
- ui/ui.c      | 5 +++--
- 3 files changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/cputree.c b/cputree.c
-index fda0200..a8dba73 100644
---- a/cputree.c
-+++ b/cputree.c
-@@ -33,6 +33,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <dirent.h>
-+#include <inttypes.h>
- 
- #include <glib.h>
- 
-@@ -417,7 +418,7 @@ static void dump_irq(struct irq_info *info, void *data)
- 		indent[i] = log_indent[0];
- 
- 	indent[i] = '\0';
--	log(TO_CONSOLE, LOG_INFO, "%sInterrupt %i node_num is %d (%s/%lu:%lu) \n", indent,
-+	log(TO_CONSOLE, LOG_INFO, "%sInterrupt %i node_num is %d (%s/%" PRIu64 ":%" PRIu64 ") \n", indent,
- 	    info->irq, irq_numa_node(info)->number, classes[info->class], info->load, (info->irq_count - info->last_irq_count));
- 	free(indent);
- }
-diff --git a/irqbalance.c b/irqbalance.c
-index 9baa955..458bb07 100644
---- a/irqbalance.c
-+++ b/irqbalance.c
-@@ -34,6 +34,7 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <fcntl.h>
-+#include <inttypes.h>
- #ifdef HAVE_GETOPT_LONG 
- #include <getopt.h>
- #endif
-@@ -357,7 +358,7 @@ void get_irq_data(struct irq_info *irq, void *data)
- 	*irqdata = newptr;
- 
- 	sprintf(*irqdata + strlen(*irqdata),
--			"IRQ %d LOAD %lu DIFF %lu CLASS %d ", irq->irq, irq->load,
-+			"IRQ %d LOAD %" PRIu64 " DIFF %" PRIu64 " CLASS %d ", irq->irq, irq->load,
- 			(irq->irq_count - irq->last_irq_count), irq->class);
- }
- 
-@@ -395,7 +396,7 @@ void get_object_stat(struct topo_obj *object, void *data)
- 
- 	*stats = newptr;
- 
--	sprintf(*stats + strlen(*stats), "TYPE %d NUMBER %d LOAD %lu SAVE_MODE %d %s",
-+	sprintf(*stats + strlen(*stats), "TYPE %d NUMBER %d LOAD %" PRIu64 " SAVE_MODE %d %s",
- 			object->obj_type, object->number, object->load,
- 			object->powersave_mode, irq_data ? irq_data : "");
- 	free(irq_data);
-diff --git a/ui/ui.c b/ui/ui.c
-index 06ec472..4cf68bf 100644
---- a/ui/ui.c
-+++ b/ui/ui.c
-@@ -1,4 +1,5 @@
- 
-+#include <inttypes.h>
- #include <string.h>
- #include "ui.h"
- 
-@@ -563,7 +564,7 @@ void settings()
- 
- 	char info[128] = "Current sleep interval between rebalancing: \0";
- 	uint8_t sleep_input_offset = strlen(info) + 3;
--	snprintf(info + strlen(info), 128 - strlen(info), "%lu\n", setup.sleep);
-+	snprintf(info + strlen(info), 128 - strlen(info), "%" PRIu64 "\n", setup.sleep);
- 	attrset(COLOR_PAIR(1));
- 	mvprintw(2, 3, info);
- 	print_all_cpus();
-@@ -588,7 +589,7 @@ void settings()
- 			if(new_sleep != setup.sleep) {
- 				setup.sleep = new_sleep;
- 				char settings_data[128];
--				snprintf(settings_data, 128, "%s %lu", SET_SLEEP, new_sleep);
-+				snprintf(settings_data, 128, "%s %" PRIu64, SET_SLEEP, new_sleep);
- 				send_settings(settings_data);
- 			}
- 			break;
--- 
-2.25.1
-
diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 587173ca65..49118f8c7d 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 28f2ad35945b93d90f4a5bad95b4c0871a0f644375f746ec16f61045b9ec970e  irqbalance-1.7.0.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  2e7ddb9687a6a5cc1f41626659eac2ad9d6b5875629156b92f693bd404d8ae63  irqbalance-1.8.0.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index eb7c3e9f3b..1efc0b7fa2 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.7.0
+IRQBALANCE_VERSION = 1.8.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
