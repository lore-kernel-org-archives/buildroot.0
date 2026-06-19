Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E848CD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 23:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314DB6F9F8;
	Fri, 19 Jun 2026 23:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tefNUxkE3loJ; Fri, 19 Jun 2026 23:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FD86F9F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781910097;
	bh=VKMwY55e4O6LdZzGy4Kha3tg6fEv05IQVY3aaG3U4Ko=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EC9Pq209rfLfTFvIQRgpU5N4pTWsHPTXxqSgEnGsN4bhPdYFi5X6+oyGYzG1cvqBj
	 0T61A3/wDQrkb2tXIOYjLX3QtvbV3LDqU5oLlNxfgbEy4pZJqPAweLM2AUudz0Bgfq
	 fB31NuBiWbpXQHayxEtYjixfvErdsAyXQ2OByGm+JExYpP+8BHY+dnMX5ZyeO2P1oI
	 RCRPOIM0xiejIIlqLmQKtpijqLy6FKAjZE9SV9BA40C8lQ3eLOptBNzwOFVH55pF+A
	 c2IeUByVC4wQnJth7sqhwLuM/o7szjjFvc4b/FRBR8XHo/sKH8bWQvhgFGqkpZC1nk
	 PerB5pGB9LoHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51FD86F9F9;
	Fri, 19 Jun 2026 23:01:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86A10367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A5585EF2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHuATsx8SihG for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 23:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D41C85EF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D41C85EF1
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C69EF8192E; Fri, 19 Jun 2026 23:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 00:44:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28c6fc47b45dd219b20640efc201a15d72370bf2
X-Git-Newrev: 61056c34b4cda499e884aa31eb99862ed5fc2eb9
X-Patchwork-Hint: ignore
Message-Id: <20260619230111.C69EF8192E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgsasl: security bump version to
 2.2.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/61056c34b4cda499e884aa31eb99862ed5fc2eb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

2.2.3: https://lists.gnu.org/archive/html/help-gsasl/2026-05/msg00001.html
       Fixes CVE-2026-48829: https://www.cvedetails.com/cve/CVE-2026-48829/

2.2.4: https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
       https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00002.html
       "GNU SASL Security Advisory: NTLM client use-of-uninitialized-value"

Upstream does not provide sha1 hashes anymore.

Updated license hash due to copyright year bump:
https://gitlab.com/gsasl/gsasl/-/commit/ec96bad53988cb79060964cf1f1568da4e301fd6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Fiona: fix notice about upstream hashes, sha256 is still provided]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libgsasl/libgsasl.hash | 10 +++-------
 package/libgsasl/libgsasl.mk   |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index de24d73c2d..eedb9adf03 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,7 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
-sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
-sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
-
-# Locally calculated after checking pgp signature
-sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
+# From https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
+sha256  d32be15efd3a04cb19b232f721bdca02cc6ad7ab415df7d79fb2dd2c0da3e0be  gsasl-2.2.4.tar.gz
 
 # Hash for license files:
-sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
+sha256  16a8258f525326a71cba997365505ad32089be4be7a7100f64f308ed01419a11  README
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 8670f43b6f..db3b64e282 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 2.2.2
+LIBGSASL_VERSION = 2.2.4
 LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
