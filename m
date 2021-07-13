Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839CEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:20:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D5260720
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4D5260720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B822405BC;
	Tue,  3 Aug 2021 22:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ufbFjocjw_V; Tue,  3 Aug 2021 22:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69CB4052F;
	Tue,  3 Aug 2021 22:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22AC21BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03B44605E0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gV9SEfMt7ALX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F41260838
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 845FA86A84; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 22:23:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d3e2e7e9a67b4097b42d827e96f872423daca622
X-Git-Newrev: c928abbed3762709dc5accb476340cf91e84a3a6
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.845FA86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/efibootmgr: bump
 version to 17
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
Content-Type: multipart/mixed; boundary="===============1252937817826993674=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1252937817826993674==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c928abbed3762709dc5accb476340cf91e84a3a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add upstream patch to fix build error:

efibootmgr.c:1541:15: error: conflicting types for ‘efi_set_verbose’
 1541 |    extern int efi_set_verbose(int verbosity, FILE *errlog);

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efibootmgr/0002-remove-extra-decl.patch | 28 +++++++++++++++++++++++++
 package/efibootmgr/efibootmgr.hash              |  4 ++--
 package/efibootmgr/efibootmgr.mk                |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/efibootmgr/0002-remove-extra-decl.patch b/package/efibootmgr/0002-remove-extra-decl.patch
new file mode 100644
index 0000000000..f838d50a20
--- /dev/null
+++ b/package/efibootmgr/0002-remove-extra-decl.patch
@@ -0,0 +1,28 @@
+From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 13 Jun 2018 09:41:01 -0400
+Subject: [PATCH] remove extra decl
+
+Downloaded from upstream commit
+https://github.com/rhboot/efibootmgr/commit/99b578501643377e0b1994b2a068b790d189d5ad
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/efibootmgr.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index de38f01..4e1a680 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
+ 					       "invalid numeric value %s\n",
+ 					       optarg);
+ 			}
+-                        /* XXX efivar-36 accidentally doesn't have a public
+-                         * header for this */
+-			extern int efi_set_verbose(int verbosity, FILE *errlog);
+ 			efi_set_verbose(opts.verbose - 2, stderr);
+ 			break;
+ 		case 'V':
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index b786a415a8..fdbc9a2732 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 5a708b9690cdc631fd75d8f598128d20cad007e711b975b0143f9517c2dd1bf4  efibootmgr-15.tar.gz
-sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  22a95ebe0d5c9fb2915b3a100450f8f37484d1dbb8b296f55b343cc84f10397d  efibootmgr-17.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 079a9b7281..7e09b5f659 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIBOOTMGR_VERSION = 15
+EFIBOOTMGR_VERSION = 17
 EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING

--===============1252937817826993674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1252937817826993674==--
