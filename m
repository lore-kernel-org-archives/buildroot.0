Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E518D3A661
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 15:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86AC6608AB;
	Tue, 29 Oct 2024 15:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nG32yBhYaI3I; Tue, 29 Oct 2024 15:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95797608A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95797608A8;
	Tue, 29 Oct 2024 15:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76E014EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5831A80EB0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wg1_0T-sC7lL for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 15:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 693DB80EAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 693DB80EAE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 693DB80EAE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:40:31 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A01EF2C8301E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:40:28 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 16:40:27 +0100
Message-ID: <20241029154028.3259870-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730216428; bh=9VUb7ETmPQvrMHRtk+pKhO4+W35DCxiBVN0gOy2rGLo=;
 h=From:To:Subject:Date;
 b=GFx5hCJIwRSeKCtLutg8fRJuTQoUoYEcGPPwMspztBF64e60GxEaDjT68xR+ywPTa
 jsKk6l6wmQ6sgyiVj+KAFR8+w/zdXuXb34DQ1X3A4M3bESdN5x2IS514Cx9Z66k0ws
 LUt405hmTuae7KqSqA/Y5glBbE7xD/Js2P6qNfINTkgkxq2IIyGJDvzwLKVQj4oknB
 sjlAGoYzEx8otxwsx0RXtvJKXVBfEZRG0SQLO4uA5Lix7Z663bCX5cHvw/clXMXVQJ
 upAKZU/ahkR3iIUQEoFwj9S0X6mCx5qzt1xLFXALFEzqXae9FzydZnbn9xJobRruWD
 5SO18qemS3v4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=GFx5hCJI
Subject: [Buildroot] [PATCH] package/c-ares: bump to 1.34.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index e1cf9f657a..9788517ebf 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061  c-ares-1.32.2.tar.gz
+sha256  35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a  c-ares-1.34.2.tar.gz
 
 # Hash for license file
 sha256  8a9994f85a8e531e1a3217ab7ba509787c6b93056aabe702137ce662db8321c2  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 4b7342cadb..6685ade9d6 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.32.2
-C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.32.2
+C_ARES_VERSION = 1.34.2
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.34.2
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
