Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CCFC3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 11:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A7980CAD;
	Mon,  8 Jul 2024 11:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJGZ4lrTkvdV; Mon,  8 Jul 2024 11:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F2A80EFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F2A80EFE;
	Mon,  8 Jul 2024 11:29:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0632F1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E707040338
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8r6oMkKElWT for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 11:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF0FB40226
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF0FB40226
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 11:29:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB10F83C4C; Mon,  8 Jul 2024 11:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 12:48:30 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: c366ecb95e154ef7cc84179915d68654c8c96737
X-Git-Newrev: eba94bc4d2178e78f4abd8942db680b4d2b6ae6f
X-Patchwork-Hint: ignore
Message-Id: <20240708112947.BB10F83C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/fluent-bit: bump
 to v3.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=eba94bc4d2178e78f4abd8942db680b4d2b6ae6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Release Notes:
- https://fluentbit.io/announcements/v3.0.4

Fixes:
- CVE-2024-4323 (https://www.tenable.com/security/research/tra-2024-17)

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 8beda6f2210e19e2fd10ff16c1ffa49b4760df11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index a53f6dba51..6fcf4fac3e 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2f3b82e8b7802fe92625009531592f12d500ff61a02ecf4cd27e0f138a6dc566  fluent-bit-3.0.3.tar.gz
+sha256  b439f89e879e538849e9106fe450bcf58da5034dfc316af4d2a837423786ed11  fluent-bit-3.0.4.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index b235c3abf4..13bd4ddecb 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.0.3
+FLUENT_BIT_VERSION = 3.0.4
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
