Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C2AC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B953A810D3;
	Tue,  2 Jul 2024 19:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIDnQ0TKtleT; Tue,  2 Jul 2024 19:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3C48110B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3C48110B;
	Tue,  2 Jul 2024 19:44:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8245C1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F79E8110B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pB-oS_XXzJFX for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEEA8810D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEEA8810D2
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97A6783B26; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 21:31:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11d2ad31046263d80da5ff6b36c3d25b1bbc0d82
X-Git-Newrev: 31135a07b6ca5d305d1c3f0010bfe838c4cdc0c6
X-Patchwork-Hint: ignore
Message-Id: <20240702194447.97A6783B26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libhid: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31135a07b6ca5d305d1c3f0010bfe838c4cdc0c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libhid fails to build with output:

    Applying 0003-uclinux.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 80.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libhid/0003-uclinux.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libhid/0003-uclinux.patch b/package/libhid/0003-uclinux.patch
index cb3c45216a..9f4502ada9 100644
--- a/package/libhid/0003-uclinux.patch
+++ b/package/libhid/0003-uclinux.patch
@@ -1,13 +1,15 @@
 Good old 'uclinux is also linux'
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -Nura libhid-0.2.16.orig/configure.ac libhid-0.2.16/configure.ac
 --- libhid-0.2.16.orig/configure.ac	2014-06-22 09:35:50.277261742 -0300
 +++ libhid-0.2.16/configure.ac	2014-06-22 09:36:10.688951947 -0300
-@@ -80,6 +80,7 @@
+@@ -79,6 +79,7 @@
+ AC_C_STRINGIZE
  
- MD_CONF_DEBUGGING
  MD_CONF_COMPILER
 +AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "uclinux")
  AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
