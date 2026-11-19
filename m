Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CA606A325
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e7/FLDTz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=A/4jvULa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE1460AD2;
	Thu, 19 Nov 2026 16:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o0QHh8mRVPK; Thu, 19 Nov 2026 16:00:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95E4360D98
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795104021;
	b=jNuI7RhzwgHIBK8aAwAhiR68DhzbGhpeF9E4VuoUL4H6FZ2/O7AmoX7Zo6Ea0uhc0E0N
	 h6wcVJteooaPrQWFm8Uvx3UjsTClKHk2XA+tMrNoh2rfnmYzarKcIbm72ZHk3LbW7jko8
	 DKz8dV0wpRQugqxLVbiKSoMjimMZQAa3ot2cAMxppsiy0YSW8Xsl+4VpM2HIcsTuLGo/8
	 bZbTCmX3E/JCCv/BUwZOz8o5zjOR3lNEJa3iUw4sPyYrFHbqyoxqxx/qiqpjcVCjujQan
	 8nWC6f+dAR02SxrIZbxM/ZJzjstcfxKO5/d0C1WC8O0wEAV0gf5cgMcc2Sx0aa8Ilbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795104021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uldZFR3vTBqyWRLBAkGn4GHbF2GRuekK13YYbz3+Z7I=;
	b=aaVXa5AcOeFa/t3LI4aubeHqT1eJXatGTJqNY2uOR0kzxJ2eyzgW1iMrWANQ2KiAniKo
	 KeUZ8uigXfPjADqLhadGw+WobzFPtkDecdGtONwM6lz80dFlh4O0gxVgwmx6j5r0U0sSq
	 NhuladHT5+Oc0atQLkmmYZ1hSZndHwyzO0ANnYDiMi9QQsaQah6fWglffTlAcakpKDnFS
	 9FBZSfxGaoXsNMS0wzhFx9Qa0q8VPnUI9vquxY4zzm3PWEX4ux5+r/l/xJOGbFHetL66c
	 vhqZgoyRdMoHxwZuvWH5T99S/u/Urx7gNDM463IaKFaTScfy6Oj7SB3dY0hz6QyHW4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b="A/4jvULa";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795104021;
	bh=uldZFR3vTBqyWRLBAkGn4GHbF2GRuekK13YYbz3+Z7I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e7/FLDTzlBXDicvPjY9s9fAOgBg1eZLDYG3aLr/S1ysWCacJPhKB1nWlbvwvJ7a93
	 TPXUx1JwaRoHtIFmD9DQe1tW1f0HKZj6N8GBEgdrt2zNl1a11OcfZxPrYz3GoMJ5Wd
	 erCtvIr8ZbZRGTPkqjxVCuC4y4fnpC+h3cj6K13C6Bv/3QGkD1mH5T9yXN31nTftBk
	 AHdxBVn4CALyEoChcYS3eFxzjloa2kBu8HJQXf0nX3qJzQFCxKAZEByo99r8Pvcb6k
	 3uk/rWuim8jzNENMR+WqnuyS/miQxkIh7FJ10tlRb06w/uE/hMIlqknWIX86j8jf9Y
	 5GyTHb6n3FO9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E4360D98;
	Thu, 19 Nov 2026 16:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56FBF3A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CD460DB0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnVkq3Eb_fUO for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 16:00:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2BBF60AD2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=A/4jvULa
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2BBF60AD2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 16:00:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=A/4jvULaUnMI3c19Qczf14tGQcm5M3vq+PvfxutwI7q2E8GsUwUOIm9Mm3+xP+e5dps94X/Hkjm1U/Tyeyxc2utALkEm9cI3wg+NNpJq8kQKijLzN3iI9YZBaCg+PJzJeXKJs78Rf6JP9xHncopJFDvI2U6tmxQwDjqaRWM9bjA1efrIqla8YHerWc7xNtTQh1NfXU7KJhsj4QBbtfi5agWX5Ot0rQ95OFhIKyyFGUAk7J1/39GQ1LiVXW0xmLQ+iMMbmU3M+9k+AMFwJQXzF1vTbUl8Jy5/vAKXY/KoAwwpqFL142FkbJc6kb2LTV8EbxhBQJqJdc49CIzcShqWbw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=6I/uxUdTE+htdNZE7r+3sWWu4hOrLlATx9VYwRC+dHQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1905850682; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 16:00:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xU4YQ-00000002da2-3AWP;
 Thu, 19 Nov 2026 17:00:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 17:00:04 +0100
Message-ID: <20261119160005.628790-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/ruby: security bump to version 4.0.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

CVE-2026-89078: Double Free issue in Regular Expression Parser
CVE-2026-93577: Integer Overflow issue in Regular Expression Compiler
CVE-2026-97229: Integer Overflow issue in CI/CD Regular Expression Compiler
CVE-2026-110264: Integer Overflow issue in Regular Expression Compiler

https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/

Heap buffer overflow in case conversion of strings
https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5

Double free in regular expression compilation
https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x

Integer overflow in case conversion of strings
https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px

Out-of-bounds read in case-insensitive regular expression matching
https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r

Heap buffer overflow in regular expression compilation
https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4

Heap buffer overflow in Regexp#to_s
https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4

Out-of-bounds read in case-insensitive backreference matching
https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h

https://www.ruby-lang.org/en/news/2026/11/18/multiple-vulnerabilities-in-regexp-and-string/

Release notes:
https://www.ruby-lang.org/en/news/2026/09/15/ruby-4-0-7-released/
https://www.ruby-lang.org/en/news/2026/10/22/ruby-4-0-8-released/
https://www.ruby-lang.org/en/news/2026/10/23/ruby-4-0-9-released/
https://www.ruby-lang.org/en/news/2026/11/18/ruby-4-0-10-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index f62a3fadb0..018f55d7a0 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,6 +1,6 @@
-# From https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
-sha256  9c9d121fe3314ea7c801e690b9de981d2b9d12d7849db99c27482468a541ba0a  ruby-4.0.6.tar.xz
-sha512  c9c391675a098b5a27dd687571ab0a164c788cbb8ddcbab6d17a3e8b3c4ba389346b2e6d7807d38db3e74d225c70e378a296d60d0f465cb0fcec9702242c83c6  ruby-4.0.6.tar.xz
+# From https://www.ruby-lang.org/en/news/2026/11/18/ruby-4-0-10-released/
+sha256  1537f7a6003c436546ecab6b48b6e7725a9af2328f45a8af7f42f41c5df90ab8  ruby-4.0.10.tar.xz
+sha512  d3fdb00e08165526065ce84a4606cdcfb9fb04ad8cfb0b516a403382cfc25e1aeed9ee4a13abdff98ebfd7241eaf32303fd7c385ef63e58c17689da88b80d847  ruby-4.0.10.tar.xz
 
 # License files, Locally calculated
 sha256  a74812486cffbdc55141a5d9f165d782cbb202660d827622ec966237d4717b99  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index bea1820f74..148230152d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 4.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
 RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
