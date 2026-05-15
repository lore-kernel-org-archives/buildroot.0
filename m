Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DB9CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D46584584;
	Fri, 15 May 2026 17:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XY8zzb0Bd3zV; Fri, 15 May 2026 17:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF21845B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867118;
	bh=Zqjdxb+1DDdoPva4UkdWlnGr7b4YgUZ1gjKsn03sReI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aF7Nw8ehAN0jO22BVVsL/6a4qsVem7ZRjX97MbwBAiuWZV2bi66A3hOGyHz08Gmdx
	 /JvL++YyWiKFU/N+WuXBRwDqM9MSDWwJI2lAPC/uXKw9rHcJJdhRmk0xwyrpGVtrJX
	 BG79XXqREHehRFZo4hedinknwCGinyHnychm8pAqfhSQXL/nf830NepNLUSnVCcuyR
	 XGwW0lNaY2IaJYkGERBjYhNLrt3CHZYZ2qn5d54vH7Dds2I8i5e2MxDyxKzJnZjt4C
	 v1BjNcRPuuNpUW2tKzoOmE5w0bEFhVgonuQOkze+izm8bI4+abUyc8KwB/u5cl4uMS
	 h2Te/iX6fU5zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF21845B1;
	Fri, 15 May 2026 17:45:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0CF423F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221846169A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6P_AIOQPP69 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A198661544
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A198661544
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFB288633C; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b28897a5fdfaae83b6acd9aaf0363b4e70bbbe14
X-Git-Newrev: 62038906f4909419cbedcabd11a9ad3b5e0e64cc
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.DFB288633C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireless-regdb:
 bump version to 2026.03.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62038906f4909419cbedcabd11a9ad3b5e0e64cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.infradead.org/pipermail/wireless-regdb/2026-March/001844.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3db2f0b33c26c4fef9b93cc268a730288db0ac24)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 39fc1a78d5..bdca077781 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
+sha256  5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac  wireless-regdb-2026.03.18.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 31bc9e9a22..7e0c585401 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.02.04
+WIRELESS_REGDB_VERSION = 2026.03.18
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
