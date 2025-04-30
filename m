Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB4C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 11:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B9382075;
	Wed, 30 Apr 2025 11:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxR6tll-wQo5; Wed, 30 Apr 2025 11:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2CA481B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2CA481B3E;
	Wed, 30 Apr 2025 11:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70FDA943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 11:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62CCF82042
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 11:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qf7AI6c2y70W for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 11:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2FB681186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FB681186
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2FB681186
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 11:49:02 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4392A3520347; Wed, 30 Apr 2025 13:48:59 +0200 (CEST)
Date: Wed, 30 Apr 2025 13:48:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aBIOK6jw0uVnsgqM@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1746013739; bh=5FvwsskkS3zHnrouLBOH+n4/Fvp++/q6cNZ6cMw1nx8=;
 h=Date:From:To:Subject:From;
 b=muSFEM2/2pJO0BMzNoQ/QwhtxKFBaLp25dhtJtap1jnDNU8QLrTwf0SqFg0lD0eQ3
 XTI2ofYVv2KovCg2Smt+l6DY0ejphuMTeZsXeufvCfK3q9n9IqxTfEmgNN+Uf0GRJc
 ZlacJVV1mt1V8KKtu6xmgTXg61Il46q3QOvupyyRN+BMEVRb6GeR/+USO2l1qU2Y2i
 15wTXZ9kXzgIldpOUqXmgWkmBIl31gmXDuQDUcu2swF8eyjJklyI6zEGYTDPHy4VTj
 /NgxjUcnaBhTV8kNEbGPC2JBtX6aIPnAspTGflWNLnKT+rUdfKQ6LHQMKCfbB+Ii7W
 MJTidigBdEFIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=muSFEM2/
Subject: [Buildroot] [PATCH] package/ruby: update to 3.4.3
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

See here for a changelog:
https://github.com/ruby/ruby/releases/tag/v3_4_3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 81c9f9c9db..ec17b092a4 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/02/14/ruby-3-4-2-released/
-sha512  cb8b5023bce316393716548c5f0a44c7d0240724ff79b995517641266af30bedc6f402c1c8fa27368ea607e2aa6d36bbb201e00c6e9dd2a80d837431d32343b5  ruby-3.4.2.tar.xz
+# https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/
+sha512  b30aad675cdcc1bdfe9e5fffe9d1925db3b3ac854a5e34180c368bc6e66f73e29ba5d802fea249353b7d799c01384c58bdd763fd1b679303158baa7824b9c08e  ruby-3.4.3.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 891fd78d4b..b06a728799 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
