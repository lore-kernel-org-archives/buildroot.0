Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477B606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 07:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LO/crjsF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CEF860601;
	Mon, 23 Nov 2026 07:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcxWpb0LbOEl; Mon, 23 Nov 2026 07:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20D3560607
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795418452;
	b=lYmF1LuAG2th993z9rATxf4OFIzyYv5I1oWo7en8/lbq2vIhr5E0vOnpGwofNhsh62tQ
	 zer7LZT5shj7JwVgcBoJtoMEf82EIszITCZr2ntjAZ9poCHGqjDX0f4fA3BAdUWc+NBVm
	 7svFzzAgUhkH/0XFbVLzaXYRMIM+wKVLSEXCDhrCn/jiC/n/TTf7eHGqdo38dTRhNkAFC
	 +vUiXLqaBuYVWWe15J8Hrk0YskBbX9FTZIESvm3aYiZfbFZDKxfdmT/GRrDmJHSCq0jnu
	 CCRZvqaVWrS5XQXaOo8/6V3CkQ/XZ4TRI9iDXhS5m/zc109UVlomFexdPotAceAGYGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795418452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U/2YfV+nj8rXvxVq+tah3TYXWW03NByDAF4U24hYYp4=;
	b=gUC6fS4v3FcblGvyOJbBrCapJMt+5d3cUlgHWv6PWHl/aL87JmRx66rRKo2dN32QKCLc
	 UePZHvo2LmPT3jcSmE9iPD1mpsPL7PGu8qfo1lGVnJK+O6cTmjMeHLthmk6KOO0P+fyqY
	 uB4C6Q2/Ik9+ftobJ28jzMJLle6TzAd9MgB926i2hnJLp9kRbisfU7J8wYnCuNxrrHSJz
	 x8LdOHa1rrKfaKcCHPHQP91j1yYftDOroii0Nw1UXtnpsGcc6Zv0NHtbPmP9UKoci5lZI
	 XGYEVzhmckPZ72iYPzT5mutgDvcqa7SAoR8wYvKn4/R1q/BUfhYohsEnS0A5/2Z1hJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795418452;
	bh=U/2YfV+nj8rXvxVq+tah3TYXWW03NByDAF4U24hYYp4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LO/crjsFYKrh6wcXhhTHsPLEOwxMgSAY3zyWiCW6Jk2BoMw1hjwUUS1bhQfOLINSw
	 Jtf9n0rpkAWzceScMn6/GWYbkVsCzoC3knY6o+A51/WAMBtu/wk917pmDeWtXuQC65
	 323sKGZIXpWoDsAZyYx1jaIvX5EKYrRYvmWQMcWBGmbjqFOi60O/tyVNM00jLRblJc
	 8CVVU5z7RCNHJWvJwFfm5SlWTWiBgIm9DWG1vnxexcD2+/4FYDmDOD4erNSmFv6sou
	 s6xDJvGEg1CcAgzwV6Hn1s+sLFkEhphQAiYmWv+vScThNczGGgNr/54fSEyJlEP1/l
	 VNp8Szp7uo8ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D3560607;
	Mon, 23 Nov 2026 07:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F016F499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1F60400AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ir9aVfiNIusz for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 07:20:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E67DE40063
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E67DE40063
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:20:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so1769544f8f.2
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 23:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795418446; x=1796023246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FupC012Rsuees1jubPq3LGhEpIEBu1XB4PPx5x/yAJ0=;
 b=lVzNOHFZwHngF5RhEpY+FHztjpJtczuI+YWBr1CfdZ5ly2jTNXOitE53cqJ+1zwliR
 ftkor0SlypuG2Na9yKm6HpkxR/F3yFe6FDSHUWjkK/W7Ns0G5ejtd1ljejldkkEgJMr2
 livB8BdZEC2sTYSI/a/7RCXFMXMqeEf2s1Z8WKGon4RiQRnrIODyCGu/50PNqXb6/MlU
 /TziJtPgtV6l5KqxFd00/BJ9wpYOmsLxMhAerffb41KzTE9fYK5NmHHm972U29S53VOU
 8JQfmvtRPqb4Dlg+zn3qX1Dby7Ivcc85OYgzD+nEBz+stDMSNYjTkg3BtSqIwziE2nYH
 YmDg==
X-Gm-Message-State: APuU4Z9dJUMDn1GE8tG4Ny9ltf79BKkewxmbqlkE8qLd6zcwyUIByjqA
 qJm3z6jZpmCtgagovIqJsfRTlsJKn0DyctGIM/3BClhVn1h6Gd5lZ95AvBB6icW87zv+ivFc5qv
 UKTxg
X-Gm-Gg: AZFdTZfIpq0v+XB/4IwkkP0ISwxCaKWG0VoxPrJOdtiBrs4m3kAwQkAApcmo8EWufYI
 K6lpGU2cC4yGxJojV0EDFEYIeLBTOq+YhI1Nv1oBmt9Lhj/G6RxYxeWg8Kp7UGKctJGFfRH4QPV
 ZNfLpTsDh6SpATr3L3UoUoq2MPY/7r+7TzYAXH/dFNXLg4dzuos4A0N01ex2Ucrs9WsHHRhNLuZ
 femvi1tnMVnv+ogKnGd0DCuNVVTaw3iAYoj+t5cijebf734U/r0t2TRhxLQBA7RY5gBTpizlzz5
 GNkpm+4XRCLb5OBNW5nKuHHEVtpjCtXOgxfWmC+f4bqbtgE3piGclCufBl1UHz6Go3a4leDJrd0
 SS+VGk1WrFkLihzCKmJr4JGfa83DnHqPr6GstHbiK0xtHyqwxyGuV6hMkfkq6UECbmF9n/f7r5x
 /ah3uIa3cvm19ArqZLLcTVFx4Rde2POxFZwhwMf06GrBJm9GapRNFkJkaO6hocYAivE+JksW27r
 Zf4cRcDELEbdSdL/6zOPMwKNLJE5d4udx/uqXlbAn6XrXoGy44ArAjbN8qRMlzFrv6GQeIxBmIa
 tJzgqKDqgc2ETya481WhMg==
X-Received: by 2002:a05:6000:4616:b0:4a6:d298:832c with SMTP id
 ffacd0b85a97d-4abb31ae4e9mr18995623f8f.31.1795418445821; 
 Sun, 22 Nov 2026 23:20:45 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61e53asm21093139f8f.59.2026.11.22.23.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 23:20:45 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Thomas Perale <thomas.perale@mind.be>
Date: Mon, 23 Nov 2026 08:20:44 +0100
Message-ID: <20261123072044.97633-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/php: security bump to v8.3.37
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For more information about the release, see:

- https://www.php.net/ChangeLog-8.php#8.3.37

Fixes the following vulnerabilities:

- CVE-2026-15353: SOAP information disclosure through malformed array
  dimensions.
  https://github.com/php/php-src/security/advisories/GHSA-q23r-hr55-xmpg

- CVE-2026-129538: PHP-CGI out-of-bounds read and write during PATH_INFO
  correction.
  https://github.com/php/php-src/security/advisories/GHSA-5j3f-64r7-f564

- CVE-2026-129496: Timezone cache use-after-free can lead to remote code
  execution.
  https://github.com/php/php-src/security/advisories/GHSA-gr4f-wgx5-jpfv

- CVE-2026-129289: PHP-FPM request smuggling through an unread HTTP
  request body.
  https://github.com/php/php-src/security/advisories/GHSA-qc49-hpvq-g2w6

- CVE-2026-129292: PHP-FPM status endpoint XSS via unescaped user and
  script fields.
  https://github.com/php/php-src/security/advisories/GHSA-3mg3-cr28-46gu

- CVE-2026-129291: PHP-FPM epoll use-after-free can lead to local
  privilege escalation.
  https://github.com/php/php-src/security/advisories/GHSA-jm4m-qfqx-967m

- CVE-2026-128090: PHAR OpenSSL signature bypass via algorithm
  downgrade.
  https://github.com/php/php-src/security/advisories/GHSA-68fq-fh7h-f8gr

- CVE-2026-126714: Partially overwritten session files can lead to
  remote code execution.
  https://github.com/php/php-src/security/advisories/GHSA-fm2m-fjf5-v3cp

- CVE-2026-115560: Session serializer mismatch can lead to remote code
  execution.
  https://github.com/php/php-src/security/advisories/GHSA-658j-r8rw-q6mx

- CVE-2026-129481: Use-after-free after interrupted session shutdown.
  https://github.com/php/php-src/security/advisories/GHSA-g3vh-838c-65v7

- CVE-2026-129506: SOAP use-after-free when processing DTD entity
  references.
  https://github.com/php/php-src/security/advisories/GHSA-4646-p932-gw34

- CVE-2026-128064: Mixed-case HTTPS and FTPS URLs can expose data in
  plaintext.
  https://github.com/php/php-src/security/advisories/GHSA-f6gg-rchx-xw8j

- CVE-2026-127960: Denial of service through folded HTTP response
  headers.
  https://github.com/php/php-src/security/advisories/GHSA-mmf9-xm3v-hg2x

(alternative to commit 5c79e22a414cdd816f691b7b756b83785b1d68b4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 604e52a54f..bb2f6c7026 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  dd54693aa334c5c4d72e9aee96b082c2473750a18a6c1d105789c93a3b1692fd  php-8.3.36.tar.xz
+sha256  0237af84478b7a7649d3964153f1b8653d622550b846f56d63062de683fb86bb  php-8.3.37.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index fd01d75e7f..a16dd1861e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.36
+PHP_VERSION = 8.3.37
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
