Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C58CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B791A851F5;
	Sat, 30 May 2026 08:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnbp4BsWZJUB; Sat, 30 May 2026 08:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D714E851ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129889;
	bh=UpYrRyXrimqrIdiEdoCu66cW1wbuSQbRYUp6cyydnOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZaWxTRSaLGzB2PGG4WxYZifACv2jQqQjv//E4f1uOOvAn+JpY84ZKZy/0fdak3vtV
	 S4rN2pUOWxnuGkoRw928pUuemeV1LqFTCGFjz3ZCXYlH+W/rcmofpZU+KXT0PyvWFC
	 thz6dwQNkw5NKQ6hMVk0W+IotNJAB+uPCmjH5Dl0/RwK8wkeUL2uOnBmI1b86+Dih0
	 plVSHrnSaTf2Gvs/shGi2FUUupBL8GX8y+Uivbp7Uvd0IionqD93h8agjJzm6QFDz9
	 DVDJiJDVcZBFqLdAti7T8Q90AFKb0OwdFrJz4ge4M3hLYKR1RA3Dghed+5/imhLErJ
	 d8CksoGThw+eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D714E851ED;
	Sat, 30 May 2026 08:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2DFF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F34409D8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEZgS9mFQ1H0 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D9340A17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19D9340A17
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:31:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10B7E835C8; Sat, 30 May 2026 08:31:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:28:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3c1619c565c15416ec9c0131e1b688a79ae3e90
X-Git-Newrev: 31716a180a3a8b3ebe53f8e68004cbfb1b1503e5
X-Patchwork-Hint: ignore
Message-Id: <20260530083114.10B7E835C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{aardvark-dns,
 netavark}: security bump to versions 1.17.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31716a180a3a8b3ebe53f8e68004cbfb1b1503e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issue:

CVE-2026-35406: netavark has incorrect error handling for malformed tcp
packets

https://github.com/advisories/GHSA-hfpq-x728-986j

aardvark-dns and netavark needs to be bumped in sync, so update both.

https://github.com/containers/aardvark-dns/releases/tag/v1.17.1
https://github.com/containers/netavark/releases/tag/v1.17.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index b3b742089a..d0a42c2ca5 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf046c3bc7bc9f1f04220a89393b9189bcab1c61c204f247b3a5415d0ac27117  aardvark-dns-v1.17.0-git4-cargo5.tar.gz
+sha256  9742d4a31d2136028221f386cf21f377cbad129626a70813f2bedad1162174ad  aardvark-dns-v1.17.1-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index c0dc7eb2a7..3f2a32ac88 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.17.0
+AARDVARK_DNS_VERSION = v1.17.1
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index f7ab17de3e..b53311c574 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ff98fe9bcb6478ef558ae277b32aad67dbd7e7b72cac66df24084cb4f9038d9  netavark-v1.17.0-git4-cargo5.tar.gz
+sha256  3bfc0d3bb40965ecd4908f9a03a4fcf59228bacfaf6a7b73736b5019181e8499  netavark-v1.17.1-git4-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index d47cee0fe1..e7126e3d4b 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.17.0
+NETAVARK_VERSION = v1.17.1
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
