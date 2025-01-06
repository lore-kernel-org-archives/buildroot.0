Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD0E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 14:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4EBB80CA6;
	Mon,  6 Jan 2025 14:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfp3z3UarY3m; Mon,  6 Jan 2025 14:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A7980C9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A7980C9A;
	Mon,  6 Jan 2025 14:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DBE46B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B35403CB
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOzSX73iA1ln for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 14:00:57 +0000 (UTC)
X-Greylist: delayed 508 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Jan 2025 14:00:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FBAD402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FBAD402AC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FBAD402AC
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:00:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 348633520825; Mon,  6 Jan 2025 14:52:23 +0100 (CET)
Date: Mon, 6 Jan 2025 14:52:23 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z3vgF8YhSYdCRn9q@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1736171543; bh=QdZCJHndNM5JAo7MvWa8KSDtpgs8fexJZnKmTMYElfg=;
 h=Date:From:To:Subject:From;
 b=uwk1LRGxYzb8TARCEZcP1Zm78Kb/EMJqtzGPZ2NDYz8tyL4kR7naU0TahHi4pYX58
 40Go6RioJpT9Ad8kqrzPzP5JWfoTElNSTqAKfwVrVxAaKHpD+k9HE2h9vJmV45xX+j
 NBNMR2PdGscxr97YV4dpn+fPg8DKO95F0LS2NxqkDFkLAXn+lFKr1cVEkmMxa3BWFK
 pVQYD9U3z+mvInRk9ar0pdoQOfaIl88pMiGuXOPo7oFOL4I5wq6QUxslaRy2om4Sg3
 ZhqNcGr43fHKg5O+FZ9cjW1YUbEzc32dLlk7VGDiH4XIBkeKpwV7qehH8GEcNVMdu7
 JrnIwrhHKkgAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=uwk1LRGx
Subject: [Buildroot] [PATCH] package/ruby: update to 3.4.1
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
https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-0-released/
https://www.ruby-lang.org/en/news/2024/11/05/ruby-3-3-6-released/

The LEGAL file was updated.
Entries for following files got removed:
[ext/json/generator/generator.c]
[ext/nkf/nkf-utf8/config.h]
[ext/nkf/nkf-utf8/nkf.c]
[ext/nkf/nkf-utf8/utf8tbl.c]
Some minor rdoc changes were made.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index d6622909e5..be3e380a55 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,7 +1,7 @@
-# https://www.ruby-lang.org/en/news/2024/09/03/3-3-5-released/
-sha512  dd5c6a7f74854e143e0ca46b9d7c0d1983fc4886f5f733cd108345dbf4b21f61ad978ad6806e05a57b7af28fd9216dd38d7145808188bbb3695a7f3a4eda3883  ruby-3.3.5.tar.xz
+# https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
+sha512  8d2e34117696f9debf463ae1eed288fdbb5c1a12e32800e901b69218e3b7302a0066052077e2ebca851e3a635296199bd5a10437eea1d6f787f69a77bb865680  ruby-3.4.1.tar.xz
 
 # License files, Locally calculated
-sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
+sha256  39917f453428cba1f1054c6a1973f74599a30b8d92e752da94e205a213ef8f92  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
 sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2e04cb3e92..be1b38ae59 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
-RUBY_VERSION_EXT = 3.3.0
+RUBY_VERSION_MAJOR = 3.4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
