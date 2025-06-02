Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7377EC5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EEF681272;
	Mon,  2 Jun 2025 20:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtmWoM9TlRff; Mon,  2 Jun 2025 20:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 530578126C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 530578126C;
	Mon,  2 Jun 2025 20:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FBD315F
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 224FE40F41
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1W_Fv54h5t4 for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 20:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BA640AB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2BA640AB7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 20:16:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D15FE8790C; Mon,  2 Jun 2025 20:16:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 2 Jun 2025 21:59:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 521920831ceedb28389802c8d9ceedfb685a7be2
X-Git-Newrev: fe4533fd0d060adb7772fb365468afdcfadc8a22
X-Patchwork-Hint: ignore
Message-Id: <20250602201623.D15FE8790C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: security bump version to
 20250602
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fe4533fd0d060adb7772fb365468afdcfadc8a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/iputils/iputils/releases/tag/20250602

Security release, fixes CVE-2025-47268 and CVE-2025-48964.

https://www.cve.org/CVERecord?id=CVE-2025-47268
https://www.cve.org/CVERecord?id=CVE-2025-48964

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien:
 - add "security" mention in commit log title
 - add link to CVEs
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 6baf433dcb..daa5f81a85 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20240905/sha256sums.asc
-sha256  599cda8e3f5f7ce4c612456ab1101369da8f79aa0f83c8e877290a1c7bb56010  iputils-20240905.tar.gz
+# https://github.com/iputils/iputils/releases/download/20250602/sha256sums.asc
+sha256  178f316c3f102f7c7445dee8bb851838f11214a68b3d5d4788972d8b35dcbbe5  iputils-20250602.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index ec8c24e4e0..391f0e1938 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20240905
+IPUTILS_VERSION = 20250602
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
