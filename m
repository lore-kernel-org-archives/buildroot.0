Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E840C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 17:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4918D60BDA;
	Sun, 13 Nov 2022 17:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4918D60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h39VEZ83R-Ic; Sun, 13 Nov 2022 17:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566EC60BD2;
	Sun, 13 Nov 2022 17:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566EC60BD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E04371BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA4A860BD0
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 17:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA4A860BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rM7xhJr-YYN5 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 17:01:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB2F660BD2
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 17:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2F660BD2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D982A8376A; Sun, 13 Nov 2022 17:01:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:55:10 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 38eaabc7f85ad5084bfd2ff13c44359549b2c6f1
X-Git-Newrev: 458e6837105b3e8e04d4a3b07228665580698876
X-Patchwork-Hint: ignore
Message-Id: <20221113170134.D982A8376A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/umtprd: add patch
 to fix output_dir make dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=458e6837105b3e8e04d4a3b07228665580698876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Object file targets need to depend on the output_dir target.

Upstream commit:
https://github.com/viveris/uMTP-Responder/commit/d84216a678edaca81c0899318231cdcca2100d38

Fixes:
- http://autobuild.buildroot.net/results/c7ce975d398190fc191ccc03813f8ec0b3464c7d/
- http://autobuild.buildroot.net/results/0331fb9cf2748b16440ef830d09452a9812f5217/
- http://autobuild.buildroot.net/results/a1b1de9e2f764ce22f23d8a8ea88f7ddcf2969a9/
- http://autobuild.buildroot.net/results/7c7dbe03d769dc5f155fc14102f6591855605640/
- http://autobuild.buildroot.net/results/6cd90b7877520669d9ab9c9fadc9fa36912963b4/
- http://autobuild.buildroot.net/results/186689fc9637ae1a8330d7e19057cd1b3c9a841c/

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f1a357452d473e384f28a37d3e4ba4146519160)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-output_dir-make-dependency.patch      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/umtprd/0001-Fix-output_dir-make-dependency.patch b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
new file mode 100644
index 0000000000..fcbca6b000
--- /dev/null
+++ b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
@@ -0,0 +1,46 @@
+From d84216a678edaca81c0899318231cdcca2100d38 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 17 Oct 2022 16:39:56 -0600
+Subject: [PATCH] Fix output_dir make dependency
+
+Object file targets need to depend on the output_dir target.
+
+Fixes:
+make --shuffle=reverse -j1
+cc -o obj/mtp_op_truncateobject.o src/mtp_operations/mtp_op_truncateobject.c -c  -I./inc -lpthread -Wall -O3
+Assembler messages:
+Fatal error: can't create obj/mtp_op_truncateobject.o: No such file or directory
+make: *** [Makefile:19: obj/mtp_op_truncateobject.o] Error 1 shuffle=reverse
+
+[paul@crapouillou.net: Backport from upstream commit d84216a]
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7c98b63..c28e186 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,15 @@ objects := $(sources:src/%.c=obj/%.o)
+ ops_sources := $(wildcard src/mtp_operations/*.c)
+ ops_objects := $(ops_sources:src/mtp_operations/%.c=obj/%.o)
+ 
+-all: output_dir umtprd
++all: umtprd
+ 
+ umtprd: $(objects) $(ops_objects)
+ 	${CC} -o $@    $^ $(LDFLAGS) -lpthread
+ 
+-$(objects): obj/%.o: src/%.c
++$(objects): obj/%.o: src/%.c | output_dir
+ 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
+ 
+-$(ops_objects): obj/%.o: src/mtp_operations/%.c
++$(ops_objects): obj/%.o: src/mtp_operations/%.c | output_dir
+ 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
+ 
+ output_dir:
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
