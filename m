Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D105C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CEC40C35;
	Tue, 22 Jul 2025 17:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9MBRliQCk1S; Tue, 22 Jul 2025 17:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC03B40C48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC03B40C48;
	Tue, 22 Jul 2025 17:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65828CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5771840072
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74_qu8LtDqsN for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D39540052
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D39540052
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8881A8699D; Tue, 22 Jul 2025 17:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Jul 2025 19:10:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e4cb7607b4949453f1497263ba06f35d5cd5b7f
X-Git-Newrev: 1471c9b421ce8438ac251a813c6a9bb291d8c6d0
X-Patchwork-Hint: ignore
Message-Id: <20250722171136.8881A8699D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: bump to version
 6.5.20250720
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1471c9b421ce8438ac251a813c6a9bb291d8c6d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250720/NEWS

Fixes observed issues with htop on aarch64/musl after the last ncurses update.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 9829cd512c..7369e3cd64 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  271044605db2f64fcd1c697c5444a08eae0f70cae33b934e59f205954004a449  ncurses-6.5-20250517.tar.gz
+sha256  fc3871f051e941a637488c07c81d984f731003e65c0f78353606e18296011aac  ncurses-6.5-20250720.tar.gz
 # Locally computed
 sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 4eac66a71c..864f62b57c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -6,7 +6,7 @@
 
 # When there is no snapshost yet for a new version, set it to the empty string
 NCURSES_VERSION_MAJOR = 6.5
-NCURSES_SNAPSHOT_DATE = 20250517
+NCURSES_SNAPSHOT_DATE = 20250720
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
