Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFBDC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB81C40AF2;
	Tue, 20 Aug 2024 17:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVk9F9z38JkK; Tue, 20 Aug 2024 17:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D667740ACD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D667740ACD;
	Tue, 20 Aug 2024 17:33:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FFC51BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF256088D
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N88yFEEfoNLk for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB8A660765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB8A660765
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB8A660765
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:32:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A9FC535211B1; Tue, 20 Aug 2024 19:32:54 +0200 (CEST)
Date: Tue, 20 Aug 2024 19:32:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsTTRhsNDiMsnH1z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724175174; bh=ctGGjBNNgQOfdPlM/0Vd5RsvRFl3CVFbk3DycxOTf3s=;
 h=Date:From:To:Subject:From;
 b=FH8rzB7CLSpiDFj6tZkUMm8mJ3DupKhL1JTNTMuJHbVua3fq9bqKXDpsAOl2f9kPh
 MsX7qyhjPnVMvBnuhzdrOy7g6VJc14+sKfGGd3e+eaNZXmCAHY6pcecZFt1QGTpNCn
 IJxJsQBFmvktU+bso6tNoAR/4l7uQgd8QSBn0ro5h3N89/Nq8Nbj/4nm7JMJgXpAYq
 XWnU7ni61vsMgmAsVq27gEACR8VEZSO4F0fn4qWvLbgGSvaTlf0oVlYVC4T4S7yLYb
 1ORBXWke8PYMzV9CV7EMcDWvOyZpvAWmzjeefE3CeEgnQ6zXrGa+c295ewIFuT6bL/
 Df0oEy65mMXxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=FH8rzB7C
Subject: [Buildroot] [PATCH next] package/babeld: update to 1.13
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

Update Homepage and Download URL.
For changes see here:
https://github.com/jech/babeld/blob/master/CHANGES

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/babeld/Config.in   | 2 +-
 package/babeld/babeld.hash | 2 +-
 package/babeld/babeld.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index c7010e1fb1..80d2708230 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_BABELD
 	  Babel is a loop-avoiding distance-vector routing protocol for
 	  IPv6 and IPv4 with fast convergence properties.
 
-	  http://www.pps.univ-paris-diderot.fr/~jch/software/babel/
+	  https://www.irif.fr/~jch/software/babel/
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 2e0513efa0..3eb5d22081 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  d085ccccfb06a11d7fa5b54c51d9c410f5f3b0a9389f584951336ff178f293b8  babeld-1.13.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 785fa2bce9..67ff553b8b 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.9.2
-BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BABELD_VERSION = 1.13
+BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
