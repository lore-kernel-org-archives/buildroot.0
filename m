Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A9AE6ADC5
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5965407A1;
	Mon, 22 Dec 2025 20:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjdpwI5vmG1R; Mon, 22 Dec 2025 20:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A7040839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766434490;
	bh=WQeI1QpNo6jA9/bDWe3MlF713d8zPQw6hZvTyAJqWmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lb0QXKy5pjItxdY8JGc6m/Z1jsasajVSIuZTVP+4fFfQZGjsyjfConl4ovZoHNRqf
	 pEj/YXoFZi84XRAygPg4TCwIwGy4sSLhvQV8iBFxqjzkG18RQxOR6as1V6p0kCFcg8
	 /PFSE1V4/GqZufqzyx1aw0BE8gP3g1te+2YVkkqhjzjWfThEOunnO/A7P55l4oBo0n
	 wUK4JMMaPojQaooej1GterAZFBweG570kpEXZ3SMejOuU3BhKhOLLIPjBe+olonCq3
	 QCOMiNMBR6KV9KOXIxGWPj4IdYkgKAOHpx0DgDf3B/uDMR3k36+CGMxYY+FP/rZ23m
	 mlh+SXKWXpW6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7A7040839;
	Mon, 22 Dec 2025 20:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B839343
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1532C40839
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0W4of4CK0Ig for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 20:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0603407A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0603407A1
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:14:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB3D585C97; Mon, 22 Dec 2025 20:14:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 20:59:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be2c536db91981a745897ffa97c88dc3e561c203
X-Git-Newrev: 3674e9f74c6487f4108ec09297b7a4f207c3b59f
X-Patchwork-Hint: ignore
Message-Id: <20251222201445.CB3D585C97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: bump to 25.11 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=3674e9f74c6487f4108ec09297b7a4f207c3b59f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release note of the new versions:
- https://doc.dpdk.org/guides/rel_notes/release_25_11.html

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/dpdk.hash | 4 ++--
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index 5c9fd7c087..7e8ef0674c 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  d5ae4cfaef05d6aa491af643d61b83d840e53ced96f9c9f60fda986313ed84b2  dpdk-24.11.3.tar.xz
+sha256  52e90d2a531ef3ded0283bd91abc94980698f1f6471fa09658a0217cf6609526  dpdk-25.11.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
-sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
+sha256  ec514554f1b9e90c4f55167267c22da9d511f884877c32a5b18bee6b7c8b18cd  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
 sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 1c7eada937..4843ba2667 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.11.3
+DPDK_VERSION = 25.11
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
