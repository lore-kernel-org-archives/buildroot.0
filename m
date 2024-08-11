Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451C9C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 05:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA04A4051D;
	Sun, 11 Aug 2024 05:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eTMYXh7LW4E; Sun, 11 Aug 2024 05:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 290C440169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 290C440169;
	Sun, 11 Aug 2024 05:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC1C1BF852
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 05:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7943580E2D
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 05:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duurX_gmnNuh for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 05:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1BBC80E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1BBC80E04
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1BBC80E04
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 05:25:25 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C4FE435211D4; Sun, 11 Aug 2024 07:25:20 +0200 (CEST)
Date: Sun, 11 Aug 2024 07:25:20 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723353921; bh=itDiqc89009s/UcVyXCaKvF08xKocTvPH6nmjYvGPUo=;
 h=Date:From:To:Subject:From;
 b=B0s+YwdseTvHXI0nK4DMbJp/5MlGeSyFibz0YSMbCNos8txnHkH6m5Rla0ytB+9ln
 j476R1moz2i9FTXHhEW3bHKxusyvyPNG5KZXguR5ZOyDSCSHoBsdq+geMko1xheaA2
 YHaeeNHTKCJtkDlbeLz/9qeSpfykb+6RdRmUUIqnwhnfCz6/fgzs/O1GkRjMMKeASZ
 FEXbZEMiUtsna351MPhx3AxZXYj0mjHmK49c5+6A4LalFJY3nyEGzBU0Fw8lrzao8a
 yYCZ/PI1jU7ZcpormJ5elbe2phMbYgTLTxwtbsfvoFXxzJ2syrT73N+CBGtgpyJeiS
 IQdUNTkzhk49w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=B0s+Ywds
Subject: [Buildroot] [PATCH next] package/hiawatha: update to 11.6
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

See here for a changelog:
https://hiawatha.leisink.net/changelog

Update Config.in to use the new homepage.
Update download site to use the new homepage.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/hiawatha/Config.in     | 2 +-
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 0c35734c34..8bcee3f098 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_HIAWATHA
 	  pipelining, keep alive connections, URL rewriting and many
 	  more.
 
-	  http://www.hiawatha-webserver.org/
+	  https://hiawatha.leisink.net/
 
 if BR2_PACKAGE_HIAWATHA
 
diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 1ee94ee69a..14b8cf8d63 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5  hiawatha-11.2.tar.gz
+sha256  b3c5eb7be007509b7e1f3d88cc03a99904d3b6e5e05d980f9d5bdaa424864dd6  hiawatha-11.6.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 3e9cf2571b..dc82e6ffde 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 11.2
-HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
+HIAWATHA_VERSION = 11.6
+HIAWATHA_SITE = https://hiawatha.leisink.net/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
