Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D70CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 17:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 641EE80F45;
	Mon, 24 Nov 2025 17:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJ9eLx6c6DnU; Mon, 24 Nov 2025 17:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8401680F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8401680F64;
	Mon, 24 Nov 2025 17:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E0EE34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FC2780F05
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLN6vgo4e7qn for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 17:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2714D80EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2714D80EE1
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2714D80EE1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:28:07 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8B0942C80043;
 Mon, 24 Nov 2025 18:28:05 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 18:28:05 +0100
Message-ID: <20251124172805.3136682-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764005285; bh=sqrnLJWThejfbVt3i+oAt/yLQQMupQI1yHYmgs5jUhA=;
 h=From:To:Cc:Subject:Date;
 b=C3WkbOqlBWFXoEVqSPAoa/O3HWXooWGBpCcMdbC6wz8VFiP2+9rjYEJC8MPm1HTFU
 AYMDB3TcV767CsEXDnzoE2mOhV0onZivrBQ8qN49mT+GzDa2li2NOF2/IKGJHPpy7N
 fiUlQYz3HS/Uert6579e9GNHhRc/sSEM47h7QVYxaD9aViwCWofe/38OFi0vG2vxEw
 coOF0nR6+JRNWHh3axdD9TzrJKcudvKLIK9zMPYNaG252ATH+b7xEsr6v+Qp/R5y3G
 jgN2TOt8uGj4OJF7yzKQ/0RsnA84OYuS4ApJwAiTt9e8OIfKtQe7/EmO4Ed/dp8sT3
 SRhWbqaTITpcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=C3WkbOql
Subject: [Buildroot] [PATCH] package/python-certifi: bump to 2025.11.12
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index ef0e0d4ca5..cc80fa1bbe 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  7fe97b2e79933430062935f3759a09b0  certifi-2025.10.5.tar.gz
-sha256  47c09d31ccf2acf0be3f701ea53595ee7e0b8fa08801c6624be771df09ae7b43  certifi-2025.10.5.tar.gz
+md5  430a5fa9f18895a9b69a018d2beae67b  certifi-2025.11.12.tar.gz
+sha256  d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316  certifi-2025.11.12.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index ad85d44bbc..1f889d425d 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2025.10.5
+PYTHON_CERTIFI_VERSION = 2025.11.12
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/4c/5b/b6ce21586237c77ce67d01dc5507039d444b630dd76611bbca2d8e5dcd91
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a2/8c/58f469717fa48465e4a50c014a0400602d3c437d7c0c468e17ada824da3a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
