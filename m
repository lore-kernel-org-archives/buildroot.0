Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC6D60B68;
	Thu, 22 Aug 2024 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkdNUQWJYon8; Thu, 22 Aug 2024 12:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FEE60B25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48FEE60B25;
	Thu, 22 Aug 2024 12:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B12B1BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0555240278
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWcg-C9ix_KM for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 12:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAC3740255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC3740255
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAC3740255
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 12:45:41 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A00652C85C6D;
 Thu, 22 Aug 2024 14:45:39 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:45:38 +0200
Message-Id: <20240822124539.728107-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724330739; bh=8l0YkpZjRgzOH3kUQvvOjdnpTCk6hAdkjvlTlDdt5xQ=;
 h=From:To:Cc:Subject:Date;
 b=FVBh96tDTll6qk0iewg5fy8kGLkpYgCzhIRpc7nrJdAEne/ssCvPrlTDlbncCD03s
 ZAg04AR/ZPYtgg7izCDaxY9sTwEC3eJ9JWWU08lvoB7P3vQyaP8ogGveEWDlrTGHK/
 y3ooQ6wcb190EH42stSrzf1tk3m1V1qmrqHPTNWtWAH1vLlpBRQPpAWN45f0rXpNA4
 pgxeWvLlqwfdsBgHTedVHRTLAEaeojENZkPfnrYI3j2GeahsB7CUC/1S4hIc3UQFAt
 DPgQNgLyDTwAkly5NenwWIQj6uOjLEG8NZmU/u6Jz+EPepyObK6dyKjt07dk5h37j1
 g0oIM8vLOcmPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=FVBh96tD
Subject: [Buildroot] [PATCH v2] package/python-wrapt: bump to 1.16.0
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
* https://wrapt.readthedocs.io/en/latest/changes.html#version-1-15-0
* https://wrapt.readthedocs.io/en/latest/changes.html#version-1-16-0

LICENSE hash changed due to updated copyright year [1].

[1] https://github.com/GrahamDumpleton/wrapt/commit/dc5afd39533ce0daf933507f8a90c095448a5cbc

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Changes v1 -> v2:
  - update license hash
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index cb62e19aa7..b89c805bf6 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  6e7340264f038efdefcba707250c91c2  wrapt-1.14.1.tar.gz
-sha256  380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d  wrapt-1.14.1.tar.gz
+md5  3e370b4bc08f7dcc518cf8895673b19c  wrapt-1.16.0.tar.gz
+sha256  5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d  wrapt-1.16.0.tar.gz
 # Locally computed sha256 checksums
-sha256  77d2a9159cffe12473f539a71a3e741f35117e61bfd005ebd60c3a1778e2c1f1  LICENSE
+sha256  5974efbbc8b626b2050810d63c3a907ee21c92bf64b3740fc623ad05eb3448ab  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 406f6c3aa1..ed4a911e14 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.14.1
+PYTHON_WRAPT_VERSION = 1.16.0
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/11/eb/e06e77394d6cf09977d92bff310cb0392930c08a338f99af6066a5a98f92
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/95/4c/063a912e20bcef7124e0df97282a8af3ff3e4b603ce84c481d6d7346be0a
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
