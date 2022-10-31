Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9E4FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8440B416C4;
	Mon, 31 Oct 2022 14:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8440B416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vx6ALgr_Z1tO; Mon, 31 Oct 2022 14:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4990E416C1;
	Mon, 31 Oct 2022 14:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4990E416C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80C991BF401
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6809E81421
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6809E81421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Id5NnWHLRiOg for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5588D81760
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5588D81760
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4137387937; Mon, 31 Oct 2022 14:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:00:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d5a94b742d5b21f480d299c319a58a5c989b382
X-Git-Newrev: 9f1a357452d473e384f28a37d3e4ba4146519160
X-Patchwork-Hint: ignore
Message-Id: <20221031140306.4137387937@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/umtprd: add patch to fix
 output_dir make dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f1a357452d473e384f28a37d3e4ba4146519160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
