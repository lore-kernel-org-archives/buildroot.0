Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8126C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FD481B0A;
	Sun, 19 Jun 2022 16:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FD481B0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6sddL2mQdEL; Sun, 19 Jun 2022 16:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8AD381819;
	Sun, 19 Jun 2022 16:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8AD381819
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0A71BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DF81404C9
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF81404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJZsu6cHYL1t for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D2D1408ED
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D2D1408ED
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 45A97873C3; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a8dae6ddd5f23c391ff4dd1c63cb6f5bb010417
X-Git-Newrev: dbfb753749807d54df5d2d2ad8ab9f10ab554043
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.45A97873C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fxload: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbfb753749807d54df5d2d2ad8ab9f10ab554043
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure:

/home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o fxload ezusb.o main.o
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fxload/0001-fix-static-build.patch | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/fxload/0001-fix-static-build.patch b/package/fxload/0001-fix-static-build.patch
new file mode 100644
index 0000000000..9ce49baa6e
--- /dev/null
+++ b/package/fxload/0001-fix-static-build.patch
@@ -0,0 +1,25 @@
+fix static build
+
+Fix the following static build failure:
+
+/home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o fxload ezusb.o main.o
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
+/home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naur fxload-2008_10_13.orig/Makefile fxload-2008_10_13/Makefile
+--- fxload-2008_10_13.orig/Makefile	2022-06-11 22:11:02.845916977 +0200
++++ fxload-2008_10_13/Makefile	2022-06-11 22:12:25.118006070 +0200
+@@ -39,7 +39,7 @@
+ 
+ # object files
+ $(PROG): $(FILES_OBJ)
+-	$(CC) -o $(PROG) $(FILES_OBJ)
++	$(CC) $(LDFLAGS) -o $(PROG) $(FILES_OBJ)
+ 
+ %.o: %.c
+ 	$(CC) -c $(CFLAGS)  $< -o $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
