Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526F6C83F22
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FD983E5E;
	Fri, 11 Jul 2025 10:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrgk4rdYakBw; Fri, 11 Jul 2025 10:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DFE83F10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DFE83F10;
	Fri, 11 Jul 2025 10:21:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B28199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 572C940DD8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRn3HIzOa4vm for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F9240C25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F9240C25
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 700EB86353; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:09 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a073d51398fb0691cf53b5608a9b487a4b60afb5
X-Git-Newrev: c78d8a4aba083a3c504c12aee2348d1a1a66edb3
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.700EB86353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/cpulimit:
 Backport fix for function signature
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

commit: https://git.buildroot.net/buildroot/commit/?id=c78d8a4aba083a3c504c12aee2348d1a1a66edb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Backport the upstream pull request patch fixing the incorrect function
signature passed to pthread_create()

Fixes: https://autobuild.buildroot.org/results/5308cb8239f31ef39e5c67d65ff1d69cdec1cedc
Fixes: https://autobuild.buildroot.org/results/6722247e3c830558ac0377352d05f4bb1684978d
Fixes: https://autobuild.buildroot.org/results/adc385fe35432be28453b8ed9f40e8a6647a4b28
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
[Julien: reformat patch "Upstream:" tag to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e63181bc0056d7590411763442c7279d71c8315b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0005-Correct-loop-function-signature.patch     | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/cpulimit/0005-Correct-loop-function-signature.patch b/package/cpulimit/0005-Correct-loop-function-signature.patch
new file mode 100644
index 0000000000..5b7f4a01dd
--- /dev/null
+++ b/package/cpulimit/0005-Correct-loop-function-signature.patch
@@ -0,0 +1,49 @@
+From 74e95c96e8d82e4e374f86142972fcf4305fe1f2 Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Wed, 2 Jul 2025 20:47:58 -0700
+Subject: [PATCH] Correct loop function signature
+
+loop is passed to pthread_create() which requires the following
+prototype to be used: void *(*start_routine) (void *)
+
+Correct the signature to avoid such warnings:
+
+In file included from busy.c:3:
+/home/buildroot/instance-0/output-1/host/mips-buildroot-linux-uclibc/sysroot/usr/include/pthread.h:164:36: note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
+  164 |                            void *(*__start_routine) (void *),
+      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
+busy.c:6:7: note: 'loop' declared here
+    6 | void *loop()
+      |       ^~~~
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+Upstream: https://github.com/opsengine/cpulimit/pull/127
+---
+ tests/busy.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/busy.c b/tests/busy.c
+index b3afb7cd853b..93f0bcce67a8 100644
+--- a/tests/busy.c
++++ b/tests/busy.c
+@@ -3,7 +3,7 @@
+ #include <pthread.h>
+ #include <unistd.h>
+ 
+-void *loop()
++void *loop(void *)
+ {
+ 	while(1);
+ }
+@@ -23,7 +23,7 @@ int main(int argc, char **argv) {
+ 			exit(1);
+ 		}
+ 	}
+-	loop();
++	loop(NULL);
+ 	return 0;
+ }
+ 
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
