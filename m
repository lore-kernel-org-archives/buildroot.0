Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB94C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E336581A0D;
	Tue, 25 Jun 2024 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWWjKpka1QFp; Tue, 25 Jun 2024 17:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D017681A30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D017681A30;
	Tue, 25 Jun 2024 17:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 219D21BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 192A84168E
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 17:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHT7MDPv8crJ for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 17:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1987940572
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1987940572
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 17:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 002D182BC8; Tue, 25 Jun 2024 17:40:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 19:37:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 410921cceb745dcdd824a7287ada12ac74d9c6dd
X-Git-Newrev: 4f1b7d0ef00af527f6a5c1fcfd18ce204a7d78e8
X-Patchwork-Hint: ignore
Message-Id: <20240625174053.002D182BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slang: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f1b7d0ef00af527f6a5c1fcfd18ce204a7d78e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
maximum fuzz factor to 0), we no longer accept fuzz in patches. Before
8f88a644ed7d was applied, alot of patches were fixed in preparatory
commits, but slang was missed (although the patch has been present since
2017.

Fix the fuzz:
  - leading TABs in Makefile commands
  - fix context

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/slang/0001-slsh-libs.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slang/0001-slsh-libs.patch b/package/slang/0001-slsh-libs.patch
index fad16d1b2f..100399e818 100644
--- a/package/slang/0001-slsh-libs.patch
+++ b/package/slang/0001-slsh-libs.patch
@@ -12,10 +12,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 +++ b/slsh/Makefile.in
 @@ -92,7 +92,7 @@
  $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
-    $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
+ 	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
 -	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
 +	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile
-    cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
+ 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
  $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h Makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
