Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15E1C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39F1400EC;
	Wed, 10 Jul 2024 15:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGthNGtURHqd; Wed, 10 Jul 2024 15:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 708FA415C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708FA415C3;
	Wed, 10 Jul 2024 15:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2D0E1BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBF88415C1
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_18EV_mfQtm for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B6EA415BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6EA415BB
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B6EA415BB
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACFE01814B9; Wed, 10 Jul 2024 17:58:23 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 17:57:54 +0200
Message-Id: <20240710155754.62512-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720627105; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=LonIq0sSQh3cLMKGRWI4YZ1Irkpk8iPqTc0a6RNX9pw=;
 b=Oemyjr4lSA3vJKczguFmC8w/XQ2LYnO8aBmv3wzlssjcda9BS/Xdb9Be4dAj3VlPh1w/dh
 TIHQgSPzGiNqqIp3BiDktIRnwt0cyu5/W89CV31cIoZR0zubR2IO9dheje90M0sQcpge6e
 yqMJAhYHosx5Tb9CZRO4rP3zm4YFBHA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Oemyjr4l
Subject: [Buildroot] [PATCH] package/sqlitecpp: require C++11
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[0] lists gcc 4.8.4 as minimum version. Since we don't have
a guard for patch versions depend on gcc 4.9

[0] http://srombauts.github.io/SQLiteCpp/#supported-platforms

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 36ee4b73f9..31de9a3904 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLITECPP
 	bool "sqlitecpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
 	help
@@ -9,5 +10,5 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
