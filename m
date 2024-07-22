Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9DEC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 10:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A1A54026A;
	Mon, 22 Jul 2024 10:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dufFLKXBAQ4a; Mon, 22 Jul 2024 10:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472B04027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472B04027D;
	Mon, 22 Jul 2024 10:20:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 023CF1BF28C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 10:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E454080BF3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 10:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfc_-oDs5ELt for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 10:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3D5180BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D5180BEE
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3D5180BEE
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 10:20:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 28EC135206AD; Mon, 22 Jul 2024 12:20:44 +0200 (CEST)
Date: Mon, 22 Jul 2024 12:20:44 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zp4yfLLt/l+SNXV/@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721643644; bh=MswGSp/J0wntt9GdgmvuCfPqUFcwlWG/C0S/FMO8C0g=;
 h=Date:From:To:Subject:From;
 b=KB8qub9sYsCCqyfna/ZwvUPlfc4BdqCxQXTaIDkbk2OEt68YMUkaV7AT8n/1TDd5X
 NO+9HjYILK8+gYVTK2AldlanE8+FvSJYoVHu94zW8O4qWGAI7L2HD+LAjNNm/C7p9B
 oIqITV1I8QZWeI9BTvngQ1MYmxDf5VkWUuJ8lAMoXG+iwbrnadmYNFiLv/rPX+Q2Xl
 DAfVMSQnc2bXEdjqHBVW5lvDxL0vjljr+8PSMeq18g+wV25U5K25P1g8I89VhKiBI4
 VKu39dDc+w3KqN3IzkoaiReBRQKw6LSBFIZICCJk61Kmi4stUc20/bw5wGq5r5QJg3
 wb6q4AXtoJc9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=KB8qub9s
Subject: [Buildroot] [PATCH] package/ruby: update to 3.3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
index 4ac6200bca..3831e701fb 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
-sha512  c58e9be9b5ab48191fbf7d67e13f0ec42ee71ed338170e0f7b246708e9cfc617ce65098f5ce7ab32d4305e785642d3e44253462104d5b9c4abcb1a4113f48347  ruby-3.3.1.tar.xz
+# https://www.ruby-lang.org/en/news/2024/07/09/ruby-3-3-4-released/
+sha512  b26461a13ff82a08a282f10108028bb2a2e4a28da6182a291062fc54089c6655d79c22cc69d59156f9b11cb10a17fe8c69d489343fbae123a45f03361b95c9eb  ruby-3.3.4.tar.xz
 
 # License files, Locally calculated
 sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index fcc637c5ea..08ecbf5941 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
 RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
