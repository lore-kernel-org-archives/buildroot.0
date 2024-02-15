Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33172C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A778B41D87;
	Thu, 15 Feb 2024 17:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EuVYv00bVSuY; Thu, 15 Feb 2024 17:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B110141D6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B110141D6D;
	Thu, 15 Feb 2024 17:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E955D1BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE3A983C2D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-9jNjtlh6yH for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E668983BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E668983BFF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E668983BFF
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:13:46 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EE4EB2C8308B;
 Thu, 15 Feb 2024 18:13:43 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 18:13:42 +0100
Message-Id: <20240215171343.1883561-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708017224; bh=C/JhJLz+atHvyOq4l8ZQO3jmXHnnIrLz97Ii3cpMnKU=;
 h=From:To:Cc:Subject:Date;
 b=Ypp1bmFN+P90HtsPALMBJTV5YR2A8hus8UoIZvE5k+qnIUb/+EQMKqhOSTJ0GAfCz
 68Qxn5JxrZ8RcWrPNSji+RuM9//suriYyU2/6vQxrLHlUri9DNM24k/Xd/k545ghmk
 vr6VOQKRuYLUaiocLSQKomz2JrOwvsVSOTiFNlAjXO1ALBbBktJyyxt1T1pnjQrOHj
 bULnSgARbSii8k4+hVZ4+BYcLTWvQtgbbiirfetuOw7owCnk/KlM2Sfsx+9p/efoik
 10gumM4XPwXkVMlo5vpzodq05QAlYCNm8o576AmZm/gVs/inaWLNSwPa0XP13t/QLf
 hPxFBFtwNm3LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Ypp1bmFN
Subject: [Buildroot] [PATCH] package/python-hatchling: bump to 1.21.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://hatch.pypa.io/dev/history/hatchling/#hatchling-v1.21.1
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index e1798e882c..df703088e4 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  21e5e7ed5fa6dd0618c5b66eb847f370  hatchling-1.21.0.tar.gz
-sha256  5c086772357a50723b825fd5da5278ac7e3697cdf7797d07541a6c90b6ff754c  hatchling-1.21.0.tar.gz
+md5  d40aaea58a04a36a2b641f6efe99e362  hatchling-1.21.1.tar.gz
+sha256  bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc  hatchling-1.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index d1ed4d23c2..550dbf0beb 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.21.0
+PYTHON_HATCHLING_VERSION = 1.21.1
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/fd/4a/8196e79c0d6e5eb10436dd2fcccc889a76af6ecf9bc35f87408159497d4d
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/d8/a1/7dd1caa87c0b15c04c6291e25112e5d082cce02ee87f221a8be1d594f857
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
