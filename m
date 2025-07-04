Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF9DC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04BB460F83;
	Fri,  4 Jul 2025 19:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02mBYTZbzsHr; Fri,  4 Jul 2025 19:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2353E60DE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2353E60DE2;
	Fri,  4 Jul 2025 19:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4D157AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D0041142
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmyhM5LC_N4s for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 19:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A65314113B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A65314113B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A65314113B
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 19:57:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4E5CBB0053D;
 Fri,  4 Jul 2025 21:57:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri,  4 Jul 2025 21:57:40 +0200
Message-ID: <20250704195740.1576078-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751659069;
 bh=wxR/ruQwGWLlUAzClqhpO9lSYoZ9X1GoULS7y9/euz4=;
 h=From:To:Cc:Subject:Date:From;
 b=D1qL51oJF9TeG/h3aIa+bQIUp+jHlAswVTf7kbq62ySUcqq56vhXIg/2UaWrBdYsN
 V5mw1pEQ/KIKDYWeYzL16xMS4v2Id7lhMiLMWiy7DDRBkd8FMsIrAraONlC3hbvcMI
 1O0gmRKcc9/0EGr+v/mfu8iMWBzv/yw/R1L5wpv9gX8wrVyBIYRXclkWItY9+PSyOD
 fFmwI7KGO1otneNzNgLW5nyiAa8mXKz0YxlO+KgQOZeEnYOu28zFQhS58fzQFiIquM
 X8wKhZuwq+QS0+4I/fVuhlZ4kqj3SlQsAkzGh4cy8mK1KHoG9nBHokIDBw8kyMCpaE
 laCoEzQEzEXwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D1qL51oJ
Subject: [Buildroot] [PATCH 1/1] package/clpeak: bump version to 1.1.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since 1.1.2, see:
https://github.com/krrishnarraj/clpeak/releases/tag/1.1.3
https://github.com/krrishnarraj/clpeak/releases/tag/1.1.4
https://github.com/krrishnarraj/clpeak/releases/tag/1.1.5

The package license changed from Unlicensed to Apache-2.0 in upstream
commit [1]. This commit updates _LICENSE and the license file hash
accordingly.

[1] https://github.com/krrishnarraj/clpeak/commit/65e572451330b4673712dfec352842f3123a9258

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clpeak/clpeak.hash | 4 ++--
 package/clpeak/clpeak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/clpeak/clpeak.hash b/package/clpeak/clpeak.hash
index 3db2a2ca6b..0ef30c5a68 100644
--- a/package/clpeak/clpeak.hash
+++ b/package/clpeak/clpeak.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bc7beba6b3307290650abc4f13fe9389b271c1a64601fa333461516950d745b  clpeak-1.1.2.tar.gz
-sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
+sha256  31620ef28848108f6868e57e100412aa009399ba2cd021afd3b64563711fa49f  clpeak-1.1.5.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/clpeak/clpeak.mk b/package/clpeak/clpeak.mk
index 616a02c0b4..7756345be6 100644
--- a/package/clpeak/clpeak.mk
+++ b/package/clpeak/clpeak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLPEAK_VERSION = 1.1.2
+CLPEAK_VERSION = 1.1.5
 CLPEAK_SITE = $(call github,krrishnarraj,clpeak,$(CLPEAK_VERSION))
-CLPEAK_LICENSE = Unlicense
+CLPEAK_LICENSE = Apache-2.0
 CLPEAK_LICENSE_FILES = LICENSE
 CLPEAK_DEPENDENCIES = libopencl opencl-clhpp
 
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
