Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677ECC35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 08:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FCD82C3C;
	Tue, 25 Mar 2025 08:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_7we696eXGg; Tue, 25 Mar 2025 08:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68FE382BF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FE382BF5;
	Tue, 25 Mar 2025 08:48:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D59EC0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2CA260D8E
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3Csf-DkzRoP for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 08:48:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F31860E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F31860E9A
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F31860E9A
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:48:50 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9F9693534D69; Tue, 25 Mar 2025 09:48:47 +0100 (CET)
Date: Tue, 25 Mar 2025 09:48:47 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z-Jt72xEQmLTB_n0@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1742892527; bh=Sgh3MnuoYNESlQ/ih0GVQVKnfqG7r40l7Y8Ty4cRhBc=;
 h=Date:From:To:Subject:From;
 b=Gz1FtyzIl2JcwSXmo+Pjh+OUGHyzP22UdRHsCBXG5TJhs6kjQqFCDk0XrJ3pzenTJ
 kO4rX7tmizKvs/WrMhHoRx1fPxe+thPh+N+c+X3tkkl6ViWhuzAYGOTUfXrNNFNKl3
 FKxrvnNksGxKK3X1ej2dHEx5Zip+9XdNn5NyJuTAVlWqSwOlZmFn+pEAXX9naSYeqc
 0FCcCPPeKEYMKXj9FiuDQhClRXhEmy+hE/VOui8HOkas6dlUUJ2ml37CnV7xqzvQEr
 yV4OZtNW/l4vL205/ehwL0LxxWXMuDtSWrplBFHn9MZHImdAUh3PFNE1S8YyJjyGwx
 YalimAy62K7sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Gz1FtyzI
Subject: [Buildroot] [PATCH] package/ruby: update to 3.4.2
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
https://github.com/ruby/ruby/releases/tag/v3_4_2

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index be3e380a55..2c523a9b3a 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
-sha512  8d2e34117696f9debf463ae1eed288fdbb5c1a12e32800e901b69218e3b7302a0066052077e2ebca851e3a635296199bd5a10437eea1d6f787f69a77bb865680  ruby-3.4.1.tar.xz
+# https://www.ruby-lang.org/en/news/2025/02/14/ruby-3-4-2-released/
+sha512  cb8b5023bce316393716548c5f0a44c7d0240724ff79b995517641266af30bedc6f402c1c8fa27368ea607e2aa6d36bbb201e00c6e9dd2a80d837431d32343b5  ruby-3.4.2.tar.xz
 
 # License files, Locally calculated
 sha256  39917f453428cba1f1054c6a1973f74599a30b8d92e752da94e205a213ef8f92  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index be1b38ae59..891fd78d4b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
