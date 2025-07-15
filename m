Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A0CC83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D783782EDB;
	Tue, 15 Jul 2025 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3_NGqKiYE-r; Tue, 15 Jul 2025 12:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEFB782F32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFB782F32;
	Tue, 15 Jul 2025 12:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0EA411AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7C1040B74
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAZPjEOEhZ4X for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 12:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B465740B5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B465740B5E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B465740B5E
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:09:27 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 36F062C83425;
 Tue, 15 Jul 2025 14:09:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 14:09:21 +0200
Message-ID: <20250715120924.1223648-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752581365; bh=YpR0FUfw9kSlmHyiY6X30f40oR4ojBrvCkVV+sPCaUc=;
 h=From:To:Cc:Subject:Date;
 b=RprlwKobtSUvzshPp+F6uCJhLC2ZLUlz+y/Uj3WhJoaGYuIlOg8sUSIic5Boses2k
 Byw4zgPYJKKlMgRzB+IMNzk+PbD+foQt7TzQYp13gB45JZDPx+FLvnC1/4Po7wYit7
 hVitN50NuOG76sbndUs9aqklKX2fH8PBxwx8kkYAbbWaOvbuoj/ZSfk5k8fgfV8Nqa
 Q1XkrEKYQ2Yahd9RNAX651APTuXzdJWfhOHVqFZM/yMWTKXxstSQcUxl0Nr3x4P+h/
 MD5Hh8kPvvHJbJ2U5iUYWM7RT5WKI/PpDR/HHqro61i3MTI7l4jeN0+kBKAB3XedGH
 +OZedhOacFGjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=RprlwKob
Subject: [Buildroot] [PATCH 1/2] package/python-msgpack: bump to version
 1.1.1
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/msgpack/msgpack-python/blob/main/ChangeLog.rst#111

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index acacd6c664..6cc5bb14c6 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  e5769d4ab610491ac561c84fde4cf4a7  msgpack-1.1.0.tar.gz
-sha256  dd432ccc2c72b914e4cb77afce64aab761c1137cc698be3984eee260bcb2896e  msgpack-1.1.0.tar.gz
+md5  abcd18fded80a89c486c0446f112eb06  msgpack-1.1.1.tar.gz
+sha256  77b79ce34a2bdab2594f490c8e80dd62a02d650b91a75159a63ec413b8d104cd  msgpack-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 92d3516186..d61e0963a1 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.1.0
+PYTHON_MSGPACK_VERSION = 1.1.1
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/cb/d0/7555686ae7ff5731205df1012ede15dd9d927f6227ea151e901c7406af4f
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/45/b1/ea4f68038a18c77c9467400d166d74c4ffa536f34761f7983a104357e614
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
