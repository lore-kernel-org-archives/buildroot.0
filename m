Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C0AC001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EFE54051B;
	Sat, 15 Jul 2023 21:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EFE54051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3XzeWNdiqYL; Sat, 15 Jul 2023 21:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B47440191;
	Sat, 15 Jul 2023 21:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B47440191
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BBB31BF389
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 21:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11F1340191
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 21:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F1340191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5X-MeDWrlvZ for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 21:06:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33160400E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33160400E5
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 21:06:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81A96A4C00F8;
 Sat, 15 Jul 2023 23:05:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52626)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKmSk-0001Jl-1q;
 Sat, 15 Jul 2023 23:05:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 23:05:58 +0200
Message-Id: <20230715210558.3642490-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689455159;
 bh=WdZv7Oy8qseZOXJcywivS5laI75FlnJwIFJ6JQNbt0M=;
 h=From:To:Cc:Subject:Date:From;
 b=Oyu/WWXrkeSwgv9ZzdYLLRDB0OHk2yCmrdqdzMBiurHm7dv6p3sQDN8U1XxlQgZI1
 Fsquwxa3DOLolq15ig3hxQ1efa5jLJN07abK7VNTJG4q++zL6YSWLE5MsQMKm9hcVC
 ucLFeBNycHIHI1Ju0Lzwqrm1zjklONYWRcNY266n+O9ic4QaE7Lrx/3oC04psKgBxQ
 KMYljTN1dDdbu+j/8qHs6rqs7r2KkFOZ3iyYi1cnouqCh/VPjg5HUFHp9k6rNwTZ7p
 PIbYgQrupBsqWFSKa66j1fCjWqwa+YZ9p8A7eN1421v15nlh4xuzqr5dNazndX0CRk
 3FFyw/ac1QwkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Oyu/WWXr
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump version to
 LTS_01_2023_Ref02
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/Azure/azure-iot-sdk-c/releases

Version LTS_07_2022_Ref02 added compatibility with OpenSSL 3.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 187b90a35a..b960c0e571 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7c23506e5acd6f400982f6f7a053d494c83b8a709c449bb9ded07aff9cfada78  azure-iot-sdk-c-LTS_07_2022_Ref01-br1.tar.gz
+sha256  7b52b9886a3aff20a55a0d5bc5e140c212f85fd06af18c31291c15d363743a77  azure-iot-sdk-c-LTS_01_2023_Ref02-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 42fdd56b48..123b4cc930 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_07_2022_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_01_2023_Ref02
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
