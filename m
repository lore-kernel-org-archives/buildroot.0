Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B26CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 06:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958BD40B68;
	Sat,  3 Oct 2026 06:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xne4LFVpdXoG; Sat,  3 Oct 2026 06:53:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7857640B9D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010412;
	b=f0z3GRB6I2KI8k3Mgn7GKCNBgZeFQ76/Eh7UD5Ocpd/5uFVTZXfphedbujgkPQPlR78M
	 +5eX7O2O5nKVZKWbPUgBWUcE3q694/rr4sfwkubBhPVVVJV9fgQkvLnvGSSSMOFGdd/vL
	 bPB10ujRhwTjJOi8zFMa/pd5mJAO8mCxvX3hRUPz9Ro1W78dknhuAqRnI3ItOcxRDTH5M
	 Y4d32s9sXpykZNpfEP8AW0/ZvIgUvGBnI66eTiYmj/OBr5sP6PkW77d3zgUeES0lOIOje
	 E846ZTgv8mcbz0X8bPVv0T3UZIkJO/RQV1zvQI3omG6+w9Srh53MKQVUZjzOM6994Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PDtbsEuiZQgG7bYpBjH64KjOjuFtOndKvV9TdzboOlg=;
	b=YOav8DIAISnXXNYsxkRxgAU9RjgaUyPUMepumZ+80mhxGiWKf8Q5gsfYN7BkvuDiauY6
	 rpsRGatfm64zWc2jbL0euw4tKE8oSEYOBoCPaKBu1R07ViOflCptWl+EVmKnPSFnhsTTB
	 VQvRtxbl3BfpRvjsUUoeh2jO9BLsBTNTVGYW6A2/W1bA2EeYbNGPGgaQmaVvX2/FA2Dte
	 132dv7ngKFi+XgmZQ4tN+3fyOT9KZrGPbbRBnVWbB5XmSqwozLqo43ag2s+KGQPoFlbyG
	 TEgE0pOqcjwLKoro/yRxfBbkeX4tFF0UV8wmwyLtIplGzpZwKtOzgVNp0THLQJCeUfg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010412;
	bh=PDtbsEuiZQgG7bYpBjH64KjOjuFtOndKvV9TdzboOlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AWZ7NpohrKfy3vnX8JvZggYyL7RbAbYnjzYVw1HzLqBCJSVOrj0qtn49x43u9gx7m
	 cfrbWgcM9BfUglwPEDkn2wH6/ltIH//s64z83UzG4LGgoSnwdho9vu46aIuqV+vxGj
	 836yqKnVEGa4APm6XW6hXWRvK9HkRbF86VjchM8qR0IggpWUQsFu+uRxDql69AQAMa
	 WFv11jGgptHQxBhF0By6KHgcsNI9xjBpDNJLYC8C9JTVt1pRwyJejztETyCBlM+l2A
	 FXbNXXejxdJxmKaHNfgQHvzUCnZpECPpMrPyVwyvk9xFJCEPWvyC9LPPCaa21hbuJV
	 L9GukVyWi17cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7857640B9D;
	Sat,  3 Oct 2026 06:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8A52E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A8B810A8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh-kBCiHDwjJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 06:53:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1286E81094
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010409;
 b=cBO62/bqZteo9EYtEDWLkA8T9oCJOLU++Rq4keaYsT5uSUJ5bFLDNUnfhs3/zRuXudPu
 8Y/b9zXwBUUs2WV13CRFQf+4Ebtg/TxiDmvFtA8JVUKeBjaYWrk/VgT6WwuuM3PNgeODS
 /yXKE8TYLQt7wuJt6KOOUZd20rgfMd2HkIr+xcLtN5luMAkAiz8+GUZ7eXLa4oiT4jM5N
 Op1jueGiPQyr8zgpduh+kMU4DMA6caxNwa7sH3Yr7k+feFIZJSmcTt0blKr0ACzwfifMN
 i2K52s6B32OLXIlRi0NuIbnhyXUSpmz9AoZVy9hNhaWRv5T0bc4poDmbra7JirfMH6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010409;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sNeyeNooeuMuR1tgDSerHgVcyuCVlBeNn5/2PEStINs=;
 b=URiQSDThRH8u6rdNqL3Pihom/Zloo6xCNZWwXrKNjROTpNbFAfDhk+lWjekbs8lIpIbi
 yk9v2bRwNfjpSJteeHA2jNjMBV1ssOhvnXJu1g6lD5+kQX8zcnBgfvqceG/jAYklY3QsF
 hJwBfqWpV1dZqzHlRWjBBd998+ktD3CVSplxvbWFojQ/rQoLcRGpI89xMPKm/xpBq/3GD
 3Dn5+GoLk45dBD37s6sT05BQfT41NbzcHq1TkVErWFioRHxuWUAOeupH/BGxw46yyOW8w
 uTWDVtR8WAz6i4N/Abtw2qIIjmofVH5S0BdXiUPj+FPKifcAsx/uC3tH+YsZxn1AC+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1286E81094
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:53:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 627FA884C5; Sat,  3 Oct 2026 06:52:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 08:53:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60b07db9cf00fbd5ce036d8b85e8526b65d8d4c5
X-Git-Newrev: 0691aac1de75377b3dd8d36965ab4a128d5e9cb1
X-Patchwork-Hint: ignore
Message-Id: <20261003065214.627FA884C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: bump version to 7.991
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0691aac1de75377b3dd8d36965ab4a128d5e9cb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-NSE-if-compiling-without-Lua-support.-Cl.patch | 29 ++++++++++++++++++++++
 package/nmap/nmap.hash                             |  6 ++---
 package/nmap/nmap.mk                               |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
