Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5448AC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1927B60906;
	Mon,  8 Jul 2024 20:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nv_gdtPvQ5sV; Mon,  8 Jul 2024 20:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B67460A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B67460A5E;
	Mon,  8 Jul 2024 20:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51D831BF97C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC12360826
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC1KKsS5qhZq for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 113AC608D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 113AC608D8
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F28057FCE7; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8fa6769ab16ae421be3c0137edff587668a8101
X-Git-Newrev: 3597b43b76406741bc0dd177ceeb017a85710ecf
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.F28057FCE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haserl: update the patches to be
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3597b43b76406741bc0dd177ceeb017a85710ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, haserl fails to build with output:

    Applying 0001-add-haserl_lualib.inc.patch using patch:
    patching file src/haserl_lualib.inc
    patching file src/Makefile.in
    Hunk #1 succeeded at 86 (offset 54 lines).
    Hunk #2 FAILED at 514.
    1 out of 2 hunks FAILED -- saving rejects to file src/Makefile.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haserl/0001-add-haserl_lualib.inc.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/haserl/0001-add-haserl_lualib.inc.patch b/package/haserl/0001-add-haserl_lualib.inc.patch
index f9e2a95e42..31a11e9512 100644
--- a/package/haserl/0001-add-haserl_lualib.inc.patch
+++ b/package/haserl/0001-add-haserl_lualib.inc.patch
@@ -7,6 +7,8 @@ Re-add .inc file from 0.9.33 so we don't need host-lua.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/Makefile.in       |    3 -
  src/haserl_lualib.inc |   97 ++++++++++++++++++++++++++++++++++++++++++++++++++
@@ -130,7 +132,7 @@ Index: haserl-0.9.29/src/Makefile.in
 ===================================================================
 --- haserl-0.9.29.orig/src/Makefile.in
 +++ haserl-0.9.29/src/Makefile.in
-@@ -32,7 +32,6 @@
+@@ -86,7 +86,6 @@
  NORMAL_UNINSTALL = :
  PRE_UNINSTALL = :
  POST_UNINSTALL = :
@@ -138,9 +140,9 @@ Index: haserl-0.9.29/src/Makefile.in
  @INCLUDE_LUASHELL_TRUE@@USE_LUA_TRUE@am__append_1 = h_lua.c h_lua.h
  @INCLUDE_LUACSHELL_TRUE@@USE_LUA_TRUE@am__append_2 = h_luac.c h_luac.h
  bin_PROGRAMS = haserl$(EXEEXT)
-@@ -515,7 +514,7 @@
- @USE_LUA_TRUE@	$(CC_FOR_BUILD) $(CFLAGS) $(LDFLAGS) $(lua2c_LDFLAGS) \
- @USE_LUA_TRUE@		-o $@ $^ $(LIBS)
+@@ -812,7 +811,7 @@
+ @USE_LUA_TRUE@	$(CC_FOR_BUILD) $(CFLAGS) $(LUA_CFLAGS) $(LDFLAGS) $(lua2c_LDFLAGS) \
+ @USE_LUA_TRUE@		-o $@ $^ $(LIBS) $(LUA_LIBS)
  
 -@USE_LUA_TRUE@haserl_lualib.inc : haserl_lualib.lua lua2c
 +@USE_LUA_TRUE@haserl_lualib.inc :
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
