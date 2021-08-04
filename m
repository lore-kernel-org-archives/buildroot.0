Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FB6C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C08560F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C08560F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0AB460600;
	Thu,  5 Aug 2021 19:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cc9fCv43zH3F; Thu,  5 Aug 2021 19:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A3960A85;
	Thu,  5 Aug 2021 19:59:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BDB41BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F6AD83B62
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIOC9GOYHETy for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADBED83B79
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7A64887DA7; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:51:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17e7863ba9c3b1946754e0f3d29cae00dc6e4d0d
X-Git-Newrev: 6ff6b065041c3c5fbe8d1bad248b8cf67930f70c
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.7A64887DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/syslog-ng: fix static
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ff6b065041c3c5fbe8d1bad248b8cf67930f70c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix static build failure raised since bump to version 3.33.1 in commit
a9e405b07976815a5b7202a5fe50c8797e754178

Fixes:
 - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...2-modules-diskq-dqtool.c-fix-static-build.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
new file mode 100644
index 0000000000..3332b12e9e
--- /dev/null
+++ b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
@@ -0,0 +1,33 @@
+From 04c8fe720d09bd6e53c4bcea9ad72ff131925ce6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 23 Jul 2021 18:41:29 +0200
+Subject: [PATCH] modules/diskq/dqtool.c: fix static build
+
+Fix the following static build failure:
+
+/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x2c): multiple definition of `verbose_flag'; modules/diskq/dqtool.o:(.sbss+0x4): first defined here
+/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x30): multiple definition of `debug_flag'; modules/diskq/dqtool.o:(.sbss+0x8): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/syslog-ng/syslog-ng/commit/04c8fe720d09bd6e53c4bcea9ad72ff131925ce6]
+---
+ modules/diskq/dqtool.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/modules/diskq/dqtool.c b/modules/diskq/dqtool.c
+index 6105f2ec68..50be452453 100644
+--- a/modules/diskq/dqtool.c
++++ b/modules/diskq/dqtool.c
+@@ -49,8 +49,6 @@ gchar *persist_file_path;
+ gchar *assign_persist_name;
+ gboolean relocate_all;
+ gboolean display_version;
+-gboolean debug_flag;
+-gboolean verbose_flag;
+ gboolean assign_help;
+ 
+ static GOptionEntry cat_options[] =
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
