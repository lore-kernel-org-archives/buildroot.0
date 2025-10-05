Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6042CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 11:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADBF41261;
	Sun,  5 Oct 2025 11:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5waspNbzcVA; Sun,  5 Oct 2025 11:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD994126D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD994126D;
	Sun,  5 Oct 2025 11:53:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 934B0909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 11:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78B704126D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 11:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEXlbfmDK_zS for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 11:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC81B41261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC81B41261
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC81B41261
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 11:53:40 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5F4DB31E0B77; Sun, 05 Oct 2025 13:53:37 +0200 (CEST)
Date: Sun, 5 Oct 2025 13:53:37 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aOJcQeRIGwDSpK01@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1759665217; bh=kab9LmPb2F6hJjH/bB4mcQblHTgroYy8Cx4LPc3tnJI=;
 h=Date:From:To:Subject:From;
 b=U1YwUK5DeDsRjnBap2P1e5dWNavp7lYEz2xvxISFx9Cxi8I+RK/nQCY8VqiHEGzd6
 04sVBkjhYriiAjav+9h3NCoa5n5EMPX63LGfzMVmhFszYnGVGrpqFj7mixsOuMz3sq
 AlQRFad9nnfKc8hPgdILobUL5Jtmct1ULA3VjQYBcgJvqZPTZkEculL0ybL6SMxT22
 3b/5UdEm5/B0ifLF9L9zLDzf1FXrs24bkFWNc85ojUFnL5A/+GuKOjzsGZa3REZ76t
 VTOBPMyuPA+nVybx4+Ggk7nQTmdI5OsOYuZg+N417doANwVflzkhRTSZs01+1tLhkB
 +NXWJ+rtWjcPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=U1YwUK5D
Subject: [Buildroot] [PATCH] package/ruby: update to 3.4.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for changes:
https://github.com/ruby/ruby/releases/tag/v3_4_4
https://github.com/ruby/ruby/releases/tag/v3_4_5
https://github.com/ruby/ruby/releases/tag/v3_4_6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index ec17b092a4..90faed4c32 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/
-sha512  b30aad675cdcc1bdfe9e5fffe9d1925db3b3ac854a5e34180c368bc6e66f73e29ba5d802fea249353b7d799c01384c58bdd763fd1b679303158baa7824b9c08e  ruby-3.4.3.tar.xz
+# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
+sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b06a728799..ffe42968b5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
