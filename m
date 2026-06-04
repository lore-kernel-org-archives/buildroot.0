Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C532ACD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98AC3807D7;
	Fri,  5 Jun 2026 12:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FACwOcSLZA0P; Fri,  5 Jun 2026 12:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE00806F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663257;
	bh=5ZRBfTXdonrLDs3T/z4xMQ+bqTEPj2ygVvcPEXCdZWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IR6C0Wt21PVhUDqAc5HiE9PQjNbNvMKPeIV3oxpsRrvSh/baHnKLmmZ6EQi7hw/Sx
	 fDOAn38D5OSWoKKGEaLavSgZcy7VnNZYFgzbPk/1I5KVmaYDYin2UK6NFlU523NaWk
	 BOzPOQ89JhfemuJC80KLI2VWunMlmyYMj6x6Z97gPQVhEKtSzwErvvmqwAIqFIEx77
	 anueE5YdBtmhvgqZwnWvsYYLk4wUFDj0yLBi24lzlK4Pp8vrEY9H6+KFIk4VHvuA8k
	 npheIIyc5vmIlm7RU1I0+O9BnVTRzQ2YwMlMMEy9d/tYCEnEUHhFJCUiKQGpHjnrlJ
	 qodzifXP32sTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE00806F2;
	Fri,  5 Jun 2026 12:40:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 018D6388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E13F440EB8
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MP9Dw0h5UzH3 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1D340FD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1D340FD0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0375887B3C; Fri,  5 Jun 2026 12:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:27:12 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3edbe84c9364f6ef9ccb8d495117d959dc975fb2
X-Git-Newrev: 4f501493834fc8854ed2e7081e125e9e7d0e8d44
X-Patchwork-Hint: ignore
Message-Id: <20260605123840.0375887B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/wireless-regdb:
 bump version to 2026.05.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f501493834fc8854ed2e7081e125e9e7d0e8d44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://lists.infradead.org/pipermail/wireless-regdb/2026-May/001917.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit df127aec63fc6ad456f7ca5e2878eb3f2e7405dd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index bdca077781..4c6b3bec78 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac  wireless-regdb-2026.03.18.tar.xz
+sha256  8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993  wireless-regdb-2026.05.30.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 7e0c585401..9761afc243 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.03.18
+WIRELESS_REGDB_VERSION = 2026.05.30
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
