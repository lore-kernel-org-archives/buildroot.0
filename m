Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721ABCE8E67
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 11:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10FD980B20;
	Thu, 24 Oct 2024 11:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-UB48MijaU7; Thu, 24 Oct 2024 11:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD7CA80A61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD7CA80A61;
	Thu, 24 Oct 2024 11:49:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D3EC972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A52940B7F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIv_NQdNMYKW for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 11:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50B6340AC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50B6340AC1
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50B6340AC1
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 11:49:40 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 085F4352067A; Thu, 24 Oct 2024 13:49:35 +0200 (CEST)
Date: Thu, 24 Oct 2024 13:49:35 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zxo0T1ba8ahWywUh@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1729770576; bh=dsLZ+bHT26yQSZ0i56TAem6IziZBIi7YmDGVi+WTjzM=;
 h=Date:From:To:Subject:From;
 b=Kq09jUKyvz4xM3JvU2sb4LrIg3qbn6fwY+CO4C5IiR7pWKtpIdHBBGRF2HrGnsmNw
 jSEBS2p5NspgrEUJvCXSjLKyglVSY/Pj3CMf3OIG0kc3BvLfN8kcd34t6NWpMem80H
 Izngh835KfWVfCKLDceWigoMCH7Z6YJRHb6JrqtXxIUO0QU+Xio71YkngIPysj1UEa
 Zn1GFHb0g3ymkrnPYKh2KSpqi+Quht3t9vNIBgAtm2tC/tNeJuyGYmxbGQURfnVCV+
 NTj3EDNMe8AUvWyf08o81nYrgU+BibjAOtVUGG2S5UDUdGi+O4qyC4vOxT1dkT2CmT
 II95w1fknz5GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Kq09jUKy
Subject: [Buildroot] [PATCH] package/ruby: update to 3.3.5
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 3831e701fb..d6622909e5 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2024/07/09/ruby-3-3-4-released/
-sha512  b26461a13ff82a08a282f10108028bb2a2e4a28da6182a291062fc54089c6655d79c22cc69d59156f9b11cb10a17fe8c69d489343fbae123a45f03361b95c9eb  ruby-3.3.4.tar.xz
+# https://www.ruby-lang.org/en/news/2024/09/03/3-3-5-released/
+sha512  dd5c6a7f74854e143e0ca46b9d7c0d1983fc4886f5f733cd108345dbf4b21f61ad978ad6806e05a57b7af28fd9216dd38d7145808188bbb3695a7f3a4eda3883  ruby-3.3.5.tar.xz
 
 # License files, Locally calculated
 sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 08ecbf5941..2e04cb3e92 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
 RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
