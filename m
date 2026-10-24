Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277D4606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HZ+kFB7s
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AAE4056E;
	Sat, 24 Oct 2026 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AckmQFDC4kfZ; Sat, 24 Oct 2026 21:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D4A740580
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876201;
	b=s6gBqQDi1u6/ibO38rFPWc77Qcp4HQtinV1oVXHSKjTsMbSl20woz2ebFeTrOrg7uXzo
	 iNZuwGn6vc1HIkiE4fvLXUe+z+KFiedF2S4q/o8hhi7oh43js9XldH99tQHu5DZcyZ6+b
	 Grckk77fjSOvci4Bl4W0IBeq1Gnqfg2ArsfyBud/mpQONrl5N59sEgMcr/94RKS5x/t92
	 YxDLLvfz08HTnbZG8oa+UA5e1+owmgh+SOyYMP4oJyQpjA61GdkyU76InDwwHaYGIziGu
	 Xvfxlg+ZDQJpAAUfaMdHjBPS5oWTPyIfkbfOz/Rv40/5lYH8bFKn/P31RU+sNGrY5QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ec7mQC4Llv9nHGgS7hq3nC2edClNcgSNxeMFqn2V3cc=;
	b=qBlAlJCZJcOJaAX8O5N9uRPX0YKhwf19IqPaIWQsNXDTsnIAwBF0IGOLlr/m4hxe30wY
	 JFssYWw+IPtCYVivakdkrc9Gcc2P9asy3LCy+YVzUB564a8dK3MyG/GH7jc6/5PatrBaz
	 5/moCFR7X5Mpp9PhEfUwgZf1BV+c7YV/05rlQePPBR7tIy1TNjP5urPEBuP0aqrVtNyZb
	 1v9JTe30GEVw6Cq0vRne2T4dveIrqgetaSeeJitX8UxKS9Eh0uleO5+6azgKYBmDgnEzZ
	 sMiABytTh6XmrA1Cbz4H7N0BWOajDcKCRdNZ5KlztuBtSeixlXt/SbH8zGAQOQ3nZFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876201;
	bh=ec7mQC4Llv9nHGgS7hq3nC2edClNcgSNxeMFqn2V3cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HZ+kFB7sr8i2GfbO6HANh5bU75vyIyWj7varqvQvAqph8OsbGn+hQBnR389BL3+uG
	 oTcJV5spkdeKXZ6LBmuzzG4IFjRtjWIyiRw4QES65aFkWYgZj0H+t0ZwbDyQ8H9ewq
	 i0/3erQuKWM4YtGZuxEw4nK+2TbbiSCtE1q5gliDdC7gfmUXXWwt4KegjNhA28Lf8o
	 uAV3t+oLpYlIceJTfUaSv8hlBUT3YViWUNGNNFun+l3pE5bBsq4SCcSsa2nkJzpT/i
	 XmCAbGg82lptEVU/2zwkmPC6gho9NB5CD1o2GqaAcxH3grpH39RrWhGPEL9jGDp8Gl
	 x/o2pOYptkKhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4A740580;
	Sat, 24 Oct 2026 21:10:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBA282F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD56D80EBE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcUdyh81tjfg for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1001880E98
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876199;
 b=RY1KSTztO8ajRLPJgGTZzGo0pX6nIYUEZwLoby1bIz9J5U51ugrvurSfZf5/Qly2RmVw
 B10jFqaB1XPeT0o6Iu+GKXiUT8Qbv1IITeWGFWPhEQFUnGrtPeqIQh15rgZTxQhR8I2Fs
 4ADUBsR4jXafGrXjJC0nyMn61FC7gfjdwI8dn5qUVpFIl+8yUOK8Myz2LySltghNdWX5H
 9t5wajwN1L7f2A61xVcD+afxUv4GJ3F/m9JrpUOIbeA9HJpa58cv34LunqxTNWgfgCfZy
 XKKq3q99MUcmhBmMuOZJMrS1J+iXQQRR/Vxoh8Qo71dMSbRZuclsQNjiwKID2LhGOvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876199;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JKcnCkCthcoKuz9j2AInuQi9vow/fsTAANVgJLGODZc=;
 b=DvVr8pLh96Mj3LKAsAUKIsh0MOKiyaZQPvyNBkzabZvKeNTa5d9gSlt/bTmaGzHlBwe8
 7lkRXmofddfe/CqS65qLU84CtbMXvzfC0U0vUgJTx/Xa4sK0e+J5BJO0Gj7IAN3Y0fcZ0
 UrjrLut9h5IDMs2EMdTwTDrWvg4CRetziP2YrrUARvs2RU1BVwy9DqkIgREbcgtqorRxM
 uxxEZOHqwmp8G7OoWjwyO+p+v7+Ooy56XGVqA7LnIFg5/B8yEfEbj1e22w4Kxygw++SxD
 wW5S+P0LOP3wk3Z0yE5AQF82bOoBzIQImWb6fLObgNP6L+oxPQ9oThYl3kzu+EdADHA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1001880E98
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E58B79CD6A; Sat, 24 Oct 2026 21:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:05:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3272ba790b30561d923cf8ad1548ad22d5c109c3
X-Git-Newrev: 2dbceeb7e67a99cbe2200aec3147bbc1f3bc4582
X-Patchwork-Hint: ignore
Message-Id: <20261024210833.E58B79CD6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump fluent-bit to
 5.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dbceeb7e67a99cbe2200aec3147bbc1f3bc4582
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion
and improved OpenTelemetry processing.

The 5.x releases also add Google Cloud Storage output, Windows Event
Tracing input, NVIDIA GPU metrics, and new metrics processors, alongside
FIPS, TLS, and proxy improvements.

Signed-off-by: Aaron Mestdagh <aaron.mestdagh@barco.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ipser-initialize-temporary-diameter-entry.patch | 31 ++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch b/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch
new file mode 100644
index 0000000000..1514779f55
--- /dev/null
+++ b/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch
@@ -0,0 +1,31 @@
+From 83086bf5092d76c2fffbcd7f0cb671083bf0a3c3 Mon Sep 17 00:00:00 2001
+From: Aaron Mestdagh <aaron.mestdagh@barco.com>
+Date: Thu, 8 Oct 2026 11:52:22 +0200
+Subject: [PATCH] lib: ripser: initialize temporary diameter entry
+
+GCC 6 does not accept implicit default construction of diameter_entry_t.
+The temporary is assigned before use, so initialize it with Ripser's existing
+invalid-index sentinel.
+
+Upstream: https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7ded167
+Signed-off-by: Aaron Mestdagh <aaron.mestdagh@barco.com>
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/ripser-1.2.1/ripser.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/ripser-1.2.1/ripser.cpp b/lib/ripser-1.2.1/ripser.cpp
+index 6bddf7271..b9ccc89d6 100644
+--- a/lib/ripser-1.2.1/ripser.cpp
++++ b/lib/ripser-1.2.1/ripser.cpp
+@@ -183,6 +183,7 @@ value_t get_diameter(const index_diameter_t& i) { return i.second; }
+ 
+ struct diameter_entry_t : std::pair<value_t, entry_t> {
+ 	using std::pair<value_t, entry_t>::pair;
++	diameter_entry_t() : std::pair<value_t, entry_t>() {}
+ 	diameter_entry_t(value_t _diameter, index_t _index, coefficient_t _coefficient)
+ 	    : diameter_entry_t(_diameter, make_entry(_index, _coefficient)) {}
+ 	diameter_entry_t(const diameter_index_t& _diameter_index, coefficient_t _coefficient)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index be02761ed5..7fb94d60b2 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44fe0f52e89a63b213695748f99691d0a6247a4bd05065f1b517c798d9f89bcc  fluent-bit-4.2.0.tar.gz
+sha256  1971d86c7dc0f3e6b906890297635d6a3a84e5e7ad64d36521b74da202fda62f  fluent-bit-5.1.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index a3a44b8dbe..b53da90706 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.2.0
+FLUENT_BIT_VERSION = 5.1.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
