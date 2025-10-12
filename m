Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B75CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D196B8135A;
	Sun, 12 Oct 2025 18:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wKvNvoEexmf; Sun, 12 Oct 2025 18:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9CB98135C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9CB98135C;
	Sun, 12 Oct 2025 18:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5392812B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45AB9607DE
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV32lUYY6vzt for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4699160725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4699160725
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4699160725
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:24:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4A7DA4C6717;
 Sun, 12 Oct 2025 20:20:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g6-000000000yp-3ymf;
 Sun, 12 Oct 2025 18:20:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:15 +0200
Message-ID: <20251012182016.2711834-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293219;
 bh=Cv5f66SIgh9nTnrLMEr5Z1FkbEHkDyN2Iu5qyoLCCLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=frK73yDJh70hNTv62ml12rdNFUohqxPuV8p21FUrqjU6vk/0qHXP++YWXqAzLJanT
 60p2pqbUP5XNHt3gnZi7Oj1Y5FBbqZnJsN9tkvqqe8gB1AB5lqhOs6a2/q49VAxP5R
 cHnJvbszEkSek+Vp8axdcQu8PcXlWrHmX6G10artHfUHRA7cIlC+iW6+D/tjz6EX0w
 MSJU26kHbVk/Tjoug4ngYGBdF+BrZi/60euaOA0kLPw8bfYgMKVews13Lnjc+NcS6I
 qJIBc2nCIUAiWLzFcnm7JMlg/d3CvFUSvyU6wmFh6DtkSwBWILmomENkXYzu+uiIjq
 hckyZByEdd1Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=frK73yDJ
Subject: [Buildroot] [PATCH 20/21] package/python-email-validator: bump
 version to 2.3.0
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-email-validator/python-email-validator.hash | 4 ++--
 package/python-email-validator/python-email-validator.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-email-validator/python-email-validator.hash b/package/python-email-validator/python-email-validator.hash
index f7a7ed8a33..16fb9518f9 100644
--- a/package/python-email-validator/python-email-validator.hash
+++ b/package/python-email-validator/python-email-validator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/email-validator/json
-md5  593073eca56ac1e947d47b9b314f2f11  email_validator-2.2.0.tar.gz
-sha256  cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7  email_validator-2.2.0.tar.gz
+md5  379aa34f196a66e16c5c0dd0c2abb2da  email_validator-2.3.0.tar.gz
+sha256  9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20eb10231ba60c54426  email_validator-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  672179752e109134a3fb2bdd0780b29fdb7a03974f0f586a13aead5129562d4c  LICENSE
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
index 35881c13a3..e54387869b 100644
--- a/package/python-email-validator/python-email-validator.mk
+++ b/package/python-email-validator/python-email-validator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAIL_VALIDATOR_VERSION = 2.2.0
+PYTHON_EMAIL_VALIDATOR_VERSION = 2.3.0
 PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
-PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/48/ce/13508a1ec3f8bb981ae4ca79ea40384becc868bfae97fd1c942bb3a001b1
+PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/f5/22/900cb125c76b7aaa450ce02fd727f452243f2e91a61af068b40adba60ea9
 PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
 PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
