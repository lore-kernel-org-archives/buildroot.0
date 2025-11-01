Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8B6CCF9F8
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 08:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D4B842212;
	Sat,  1 Nov 2025 08:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggnUcUZHJFSe; Sat,  1 Nov 2025 08:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C6E42214
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C6E42214;
	Sat,  1 Nov 2025 08:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2C88113C
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02DB61C38
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4sI2k8Qf5Uv for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 08:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EF4661C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF4661C36
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EF4661C36
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:02:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 207E0A4C5CF1;
 Sat,  1 Nov 2025 09:02:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vF6ZJ-000000008BB-0kp4;
 Sat, 01 Nov 2025 08:02:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat,  1 Nov 2025 09:02:36 +0100
Message-ID: <20251101080236.305350-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251101080236.305350-1-bernd@kuhls.net>
References: <20251101080236.305350-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761984157;
 bh=+h1Jd93nC0SqSrei3IEoXvzUwLQS1TXTHy4hFHsPgxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eoUJFUuy2pldS6gmA5gA7fo4yvy4GWadmeWYm/nKpcmy8fIKwg5d0vU26TRE5Fszx
 JK6fo4u7ZwhdcmfS9E1ztba5WbI32y8/0Alma/LdluPZZpfD6SZ5h2Cg++g3BsNNtG
 +8FajOmvUvp6V+1OnQVS44m3+H9YcMHCJo2V8JzkeX0We0fZAfb44JhBUERxTQyAxn
 FDnsDd5m9RpZ5GTk7fG3JTfDBUslTMSxMG6MWtGIZiJc4PF+sIWpUmSWsfcmV4EG9W
 +/IgGkw64ky0fwil7kfLzpuNLYsrxvUMQ9lCVvSM1ijZshOsBY6iF107V9HIQltbtL
 c0ZRaNUkYGA7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=eoUJFUuy
Subject: [Buildroot] [PATCH 2/2] package/agentpp: bump version to 4.7.2
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

Changelog: https://www.agentpp.com//download/changes_agent++.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 7c94f4b1b0..6bde308027 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3287218cf6eaa3744b3788afd1e7d72e7a9508d45741243178404f6b47edd86f  agent++-4.6.1.tar.gz
+sha256  10542169c3cea8cb547a0b7a678d631eda6d0b4b0381dc84df4cf5d26905db13  agent++-4.7.2.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 3756d0ca28..fdd3d60859 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.6.1
+AGENTPP_VERSION = 4.7.2
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
