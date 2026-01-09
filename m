Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786BD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BEF860BD2;
	Tue, 13 Jan 2026 19:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPwM11oA5sKg; Tue, 13 Jan 2026 19:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDA860BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332987;
	bh=z+QylAQtWW/lbz+Bz+MsusiB6amXaAyoJQDXa4fvsc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rI4ZMTgJ5C0kLJMLeWznIF0gouxxPV1aUWGAqRj5+/NQAagqDRuFebMnIFsVll8tA
	 aKs+KPrzSoCNMPkDHcnTrSX605XmrKarS2DOP8S2GtJfqRLjbiUy+pH6wyZM81PdZs
	 GJd6yGDR9MKiOf6yYwXjwED3tfnkFAt68tyC0fiBHvJaC5cxrX49KRamsm4ENr80Wg
	 9Xw2LP4b5joY9r/c/Dwxpw4J9c0CGq52ne3toa9iJMGi+sxX3hNNp7R81yUijrYx5v
	 dd/kOUgS0Qt1akd7OBRqKsCuo60kOr/U04AycZPgXzGR9zwkG4u7ETsXlLhiR0FT+u
	 BbsxAQRZUqAMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDA860BE2;
	Tue, 13 Jan 2026 19:36:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 145D41C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E3B4050C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFsBPht5ezLT for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC01402F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC01402F4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF20388549; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 15:57:46 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4d2210dcfa5efc575dc9240fe3cdc44cc88e8584
X-Git-Newrev: 4096db6b07a796286292a15840049cd45608ebf4
X-Patchwork-Hint: ignore
Message-Id: <20260113193616.BF20388549@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/embiggen-disk:
 fix EMBIGGEN_DISK_VERSION
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4096db6b07a796286292a15840049cd45608ebf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Make EMBIGGEN_DISK_VERSION compliant with release-monitoring.org.

Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9824b964a7db1a69885ddbfefc40663d591dc653)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/embiggen-disk/embiggen-disk.hash | 2 +-
 package/embiggen-disk/embiggen-disk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 02c99add6a..1a327dce2a 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
+sha256  67ab51d13c85c5e3f1805f1e7b1e2db92edf8472007cd859c5919692eb0c0cbc  embiggen-disk-20240521-go2.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
index 47b86c072b..a981cdf87f 100644
--- a/package/embiggen-disk/embiggen-disk.mk
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EMBIGGEN_DISK_VERSION = v20240521
-EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_VERSION = 20240521
+EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,v$(EMBIGGEN_DISK_VERSION))
 EMBIGGEN_DISK_LICENSE = Apache-2.0
 EMBIGGEN_DISK_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
