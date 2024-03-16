Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCBDC54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811A24084E;
	Sat, 16 Mar 2024 22:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GentHhDnQcif; Sat, 16 Mar 2024 22:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06B62408FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B62408FF;
	Sat, 16 Mar 2024 22:00:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22C391BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1054E81AD1
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQuZKVTE2Sla for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D1E81761
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21D1E81761
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06840883CB; Sat, 16 Mar 2024 22:00:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 21:55:31 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a50be2501af419fe52f8a049f010c51bd0ce7544
X-Git-Newrev: b5dd0d5668c18242f2549b0ce19685837cc7f814
X-Patchwork-Hint: ignore
Message-Id: <20240316220050.06840883CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/ghostscript:
 security bump to version 10.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5dd0d5668c18242f2549b0ce19685837cc7f814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

For release note, see:
https://ghostscript.readthedocs.io/en/gs10.02.1/News.html

For detailed history, see:
https://git.ghostscript.com/?p=ghostpdl.git;a=shortlog;h=refs/tags/ghostpdl-10.02.1

Fixes:
- CVE-2023-46751:
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-46751

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c456fefb9120ef9a9580b1a97d6fd67b90a42a82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 77c8faccbe..849f6c64ba 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10020/SHA512SUMS
-sha512  c49344151063e915add55a0a842c2a645d8362a5cbca663bd07638f4bd3699a08cade37a9efe905ad5a41e014353e5e1b1268b7925e43128ad30d5b031396b71  ghostscript-10.02.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10021/SHA512SUMS
+sha512  ee0f754c1bd8a18428ad14eaa3ead80ff8b96275af5012e7a8384f1f10490da056eec9ae3cc791a7a13a24e16e54df5bccdd109c7d53a14534bbd7360a300b11  ghostscript-10.02.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 161521f970..da23ebbadb 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.02.0
+GHOSTSCRIPT_VERSION = 10.02.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
