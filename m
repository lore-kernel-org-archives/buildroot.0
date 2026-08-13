Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA422C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6835F60769;
	Thu, 13 Aug 2026 20:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REeDHJf0n5RO; Thu, 13 Aug 2026 20:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 922B0606D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786654622;
	bh=3S74JPw8fiMdwepwzBPy3nM9RrP/akn/OQIJZUFpLAo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=e/W/UgrBAPv6h94U9RJTKR5oc250K0cp9iAnuDAVrsof0jZ7hPjNicdLqaW7h2fxJ
	 WRrKDdOQwsDnsCWc8fobjt6w9/WIb6r/gPGxERqA/u4O4HxRtI6WHfFTFFZpRs1LJR
	 9mGKd9zjP/jO4Iu733F+J74AW6f0nyV+o2XHHic/KbHbie9+p/mn22A7WyHYG11MoP
	 ivo/E0BaL8m0+S9WaICMZn/VyKMTIiFdFMMQ3veFg/EeLZJ7/CrPIWP+DvoDJUt8bl
	 Na+VEh3CknIAesCoIWUIfaVYhFH2WKLXXpKZqduoojqiO6IVIRZT7GursmfIfqBldW
	 XjWCOce2NAEPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 922B0606D5;
	Thu, 13 Aug 2026 20:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D925D198
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFFEA40094
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTfIUihJZKOE for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B15640024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B15640024
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B15640024
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:56:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9B73B1A1611
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D64D5FF0B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:56:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6795611C4E442; 
 Thu, 13 Aug 2026 22:56:49 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2026 22:56:46 +0200
Message-ID: <20260813205647.44839-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/assimp: bump to version 6.0.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

6.0.3 Changelog:
https://github.com/assimp/assimp/releases#release-v6.0.3

6.0.4 Changelog:
https://github.com/assimp/assimp/releases#release-v6.0.4

6.0.5 Changelog:
https://github.com/assimp/assimp/releases#release-v6.0.5

Sadly, it doesn't fix any of the four CVEs currently affecting assimp
according to https://security.buildroot.org/master/component/assimp.

License file hash updated due to:

-Copyright (c) 2006-2021, assimp team
+Copyright (c) 2006-2026, assimp team

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/assimp/assimp.hash | 4 ++--
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 93c081351e..4ede41dfd9 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d1822d9a19c9205d6e8bc533bf897174ddb360ce504680f294170cc1d6319751  assimp-6.0.2.tar.gz
-sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
+sha256  edf3749559c2b7d1f758ffb66fc5bec62186221e623b7f2e8969f17ee46ecb6f  assimp-6.0.5.tar.gz
+sha256  21195d410708b82757d3e34c3a40c427f6e59339da862e9480d4fcdc79b7a1bd  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index dd61b69ca2..cbacf181d2 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 6.0.2
+ASSIMP_VERSION = 6.0.5
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
