Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4CEC3DA47
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 17:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E52F4137A;
	Tue,  9 Jul 2024 17:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BJb81Xeg78Q; Tue,  9 Jul 2024 17:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15CE74138B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CE74138B;
	Tue,  9 Jul 2024 17:10:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 273351BF852
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 720E580CD7
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e1AO1GBQ04u for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 17:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A499F80CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A499F80CE7
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 17:10:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9151584395; Tue,  9 Jul 2024 17:10:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 19:03:15 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 167680d773a2edc19defe24e50f0af9fc1e9816e
X-Git-Newrev: 8ac7ef56845564715d379a4c0e82339ef9dd61b2
X-Patchwork-Hint: ignore
Message-Id: <20240709171037.9151584395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libmad: drop
 GCC's "-fforce-mem" option
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
Content-Type: multipart/mixed; boundary="===============5900546391314791047=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5900546391314791047==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8ac7ef56845564715d379a4c0e82339ef9dd61b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The commit fixes the following compilation error:

    i686-buildroot-linux-gnu-gcc.br_real: error: unrecognized command-line option ‘-fforce-mem’

From GCC 4.3 release notes [1]:

    The -fforce-mem option has been removed because it has had no effect
    in the last few GCC releases.

[1] https://gcc.gnu.org/gcc-4.3/changes.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 89ba9c5a0b05f119d8f748f52244ebcb6a0dd008)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/0003-drop-GCC-fforce-mem-option.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/libmad/0003-drop-GCC-fforce-mem-option.patch b/package/libmad/0003-drop-GCC-fforce-mem-option.patch
new file mode 100644
index 0000000000..25b685efd0
--- /dev/null
+++ b/package/libmad/0003-drop-GCC-fforce-mem-option.patch
@@ -0,0 +1,18 @@
+configure.ac: drop GCC "-fforce-mem" option 
+
+As reported at [1], the option has been removed from version 4.3 of GCC.
+
+[1] https://ez.analog.com/dsp/software-and-development-tools/linux-blackfin/linux-bug-archive/w/documents/7460/5626-build-lib-mad-fail-at-option--fforce-mem-with-gcc-4-3
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: Dead
+
+--- libmad-0.15.1b-orig/configure.ac	2024-07-02 14:26:40.657984791 +0200
++++ libmad-0.15.1b/configure.ac	2024-07-02 14:27:07.098198997 +0200
+@@ -140,7 +140,6 @@
+     case "$optimize" in
+ 	-O|"-O "*)
+ 	    optimize="-O"
+-	    optimize="$optimize -fforce-mem"
+ 	    optimize="$optimize -fforce-addr"
+ 	    : #x optimize="$optimize -finline-functions"
+ 	    : #- optimize="$optimize -fstrength-reduce"

--===============5900546391314791047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5900546391314791047==--
