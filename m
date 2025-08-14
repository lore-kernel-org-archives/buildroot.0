Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FB7CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D134D6077A;
	Thu, 14 Aug 2025 20:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLT6oa8J2gyv; Thu, 14 Aug 2025 20:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D81B60751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D81B60751;
	Thu, 14 Aug 2025 20:06:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0921B228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A95B80C97
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGIQWJuPzeGz for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CCE80C99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49CCE80C99
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 482C786F0D; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:48 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2fe351d66a2112a1beec85192d62a2d8e8c533bd
X-Git-Newrev: 0cd5b4d6a625a00c50df7f6394b6abd7e0ac2b76
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.482C786F0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/nanocom: fix
 build with GCC 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cd5b4d6a625a00c50df7f6394b6abd7e0ac2b76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

GCC 14 made implicit function definitions an error and the forward declaration
for display_state() was using the wrong name, causing a compilation
failure at the call site.

Fixes: https://autobuild.buildroot.org/results/ebf/ebf500c48aaa357aaac3a88d87ef8f5c07cd78b6

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 6db1aeaeef3726ad07e6d6afc90a3e8c721d3728)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nanocom/0002-fix-build-with-gcc-14.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/nanocom/0002-fix-build-with-gcc-14.patch b/package/nanocom/0002-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..87df33a04d
--- /dev/null
+++ b/package/nanocom/0002-fix-build-with-gcc-14.patch
@@ -0,0 +1,19 @@
+GCC 14 made implicit function definitions an error and the forward declaration
+for display_state() was using the wrong name, causing a compilation
+failure at the call site.
+
+Upstream: Submitted to author via email
+Signed-off-by: Florian Larysch <fl@n621.de>
+
+diff -purN old/nanocom.h new/nanocom.h
+--- old/nanocom.h	2025-08-10 01:34:12.000284003 +0200
++++ new/nanocom.h	2025-08-10 01:27:59.545821909 +0200
+@@ -56,7 +56,7 @@ void cleanup_termios(int signal);
+ void init_stdin(struct termios *sts);
+ void init_comm();
+ void usage( char *str);
+-void display_status();
++void display_state();
+ 
+ 
+ /*typedef to represent the current line state
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
