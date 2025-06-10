Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19575C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 15:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F0983ADB;
	Tue, 10 Jun 2025 15:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tq7Tb_1iytQC; Tue, 10 Jun 2025 15:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 852A283B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852A283B3F;
	Tue, 10 Jun 2025 15:05:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D60801F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBF6460F97
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9quSEc6apIUf for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 15:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B53186074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53186074D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B53186074D
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:05:30 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 92FE22C838EE;
 Tue, 10 Jun 2025 17:05:28 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 17:05:24 +0200
Message-ID: <20250610150527.96508-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1749567928; bh=2hl1rewkcqFOA2Umd/yZNbNJepScs6LhXVn1BtiXhyU=;
 h=From:To:Cc:Subject:Date;
 b=S92dZdeR8Rp3mqbNKULJ17JFenoe4MvwYtKssh9ou1c/B8On4EOSdOssw6i3yNhJ7
 LwUx5Ann/eAV8FdNh1yCgkMBPi++zjQEr1s6kCJLLgHxzj3DBqfCHpL4NZ6NKUADK7
 TeNYDsu035t6+d/u043neD2O5Sy8s7iN8G9cnIf/bk5iWH3SXtuCYKGDKzAiWtLP9D
 a7U+VvKI2nXgX+xYdmT2a+6kfRvYivePEpZ2R3TKa2k1aMqIkS2YNQu7D7QKChRcGd
 S0AKn+1JCNl0deF8xEKfJrTBVWJNYuL+97EVCMO30ium/cN2XN7Y73Q67G0J5sndJQ
 uBYuKY5OEYFAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=S92dZdeR
Subject: [Buildroot] [PATCH 1/2] package/python-requests: security bump to
 2.32.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: CVE-2024-47081
  Fixed an issue where a maliciously crafted URL and
  trusted environment will retrieve credentials for
  the wrong hostname/machine from a netrc file.

Release notes: https://github.com/psf/requests/releases/tag/v2.32.4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 2764a0f2d2..c391d553c9 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  fa3ee5ac3f1b3f4368bd74ab530d3f0f  requests-2.32.3.tar.gz
-sha256  55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760  requests-2.32.3.tar.gz
+md5  4a380c14fe0f4465c9dbf79ffacefd8f  requests-2.32.4.tar.gz
+sha256  27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422  requests-2.32.4.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index fc8f51fd1f..c782060d57 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.32.3
+PYTHON_REQUESTS_VERSION = 2.32.4
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
