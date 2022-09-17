Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB9ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B006F41E18;
	Sat, 17 Sep 2022 20:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B006F41E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQmSkc5gijoA; Sat, 17 Sep 2022 20:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA3041E26;
	Sat, 17 Sep 2022 20:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA3041E26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910601BF976
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 787D641DE3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787D641DE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bu_izX8gemYj for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:26:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62CBD41BF4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62CBD41BF4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 503ED8469F; Sat, 17 Sep 2022 20:26:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:22:40 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ba675342e1581a9f76a05d1f6e0e0b86a108d639
X-Git-Newrev: 6168d12484c8e255cca3320f5b79cdc3c246271a
X-Patchwork-Hint: ignore
Message-Id: <20220917202647.503ED8469F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/mutt: bump to
 version 2.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6168d12484c8e255cca3320f5b79cdc3c246271a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This is a bug-fix release, fixing a $edit_headers bug on MacOS, along
with a few other small bugs. It also tightens the $query_command parser
to accept a single tab between fields, and changes $pager to accept a %s
expando.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-7-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 628f3dc54c8e3149f7b5ac727f1b6cf846460b72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 0bec59def4..27e439183a 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffa2d93517cfc606fe01daffc5f12e42062a1c134d3b9af78484ebc5430888d3  mutt-2.2.6.tar.gz
+sha256  eb13858f58bb369f477bf652d90e9b6aaddd0d610acbea3455049e5efad36df1  mutt-2.2.7.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5b1119c79b..7a4bc1b10c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.6
+MUTT_VERSION = 2.2.7
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
