Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4ACD10F23
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 17:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DDD6060A;
	Sun, 17 Nov 2024 17:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaUXyRG7h-9m; Sun, 17 Nov 2024 17:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1602D61477
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1602D61477;
	Sun, 17 Nov 2024 17:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0DC9AF0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 17:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C173C42CE0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 17:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kCdPgGd6WBe for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 17:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9A7842CE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A7842CE2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9A7842CE2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 17:03:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F0B9BB005A2;
 Sun, 17 Nov 2024 18:03:46 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 18:03:43 +0100
Message-ID: <20241117170343.753987-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731863028;
 bh=n/pnVgK8iD24BKhKxw5FSpKEGl3DJOYhEEZ/TuBgmUE=;
 h=From:To:Cc:Subject:Date:From;
 b=gVr/CxdVu4oLc+6lZsyYbmlpEHQOb5263bXXH/7HP9iuxEKBUdbyo/n68hD/pYLuh
 TJrWiIqU6a5z+V3/8BABwIJmXoY7KaS33AU7l8F3vEMgHKSgCwgQqJu/wheY2C5ihb
 +wh0f+OI2e7lSP0xfr38hI44IXpn4gpBv7EQDb+c/cNt6hwFIXkMD9YkZY74S6eLwf
 00gwoLd+QOIpqtKseGZSEhsq8bOLc5udKvVctcObf8NJjAr3J/0e2n1j9gXv92NXcf
 w0DZ/n3sRmt3iYGEfsr9QpEnR6GiE1jawC+cJSh+e53iXg8x9eU4H7z9bYsHAXjsUQ
 k1Glprzjip9hQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gVr/CxdV
Subject: [Buildroot] [PATCH 1/1] Config.in: fix _FORTIFY_SOURCE help string
 typos
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

The Config.in help string for BR2_FORTIFY_SOURCE_{2,3} mention
"_FORTIFY_SOURCES" (plural, with an extra "S"). The correct macro name
is "_FORTIFY_SOURCE" (without the "S"). See [1].

This commit fixes those typos.

[1] https://www.gnu.org/software/libc/manual/html_node/Source-Fortification.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index df43db7eff..d7a8dc6848 100644
--- a/Config.in
+++ b/Config.in
@@ -963,7 +963,7 @@ config BR2_FORTIFY_SOURCE_2
 	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
 	depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
-	  This option sets _FORTIFY_SOURCES to 2 and some more
+	  This option sets _FORTIFY_SOURCE to 2 and some more
 	  checking is added, but some conforming programs might fail.
 	  Also adds checks at run-time (detected buffer overflow
 	  terminates the program)
@@ -972,7 +972,7 @@ config BR2_FORTIFY_SOURCE_3
 	bool "Extended"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	help
-	  This option sets _FORTIFY_SOURCES to 3 and even more
+	  This option sets _FORTIFY_SOURCE to 3 and even more
 	  checking is added compared to level 2. Extends checks at
 	  run-time that can introduce an additional performance
 	  overhead.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
