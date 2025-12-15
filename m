Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00DFD5B86E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3768111E;
	Mon, 15 Dec 2025 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nffy_fUd9o2h; Mon, 15 Dec 2025 21:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F71B810E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833012;
	bh=kDUCBkhQN8Xn3LlI3hBz2s3UTI0JV7FVic5618q14yA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rI/fwwfCusddWyqomUHqd9Uaq2PgKhvMwxXeYDz7jxOO3rQkRpSqFNN9/0ihwYKrc
	 lnZbPdaN6i1KM0KkKlwh7UXbqaay1AAWmLCv3VfnEQLUHGAEsuZrJt4S6ynq8VhG/r
	 /sw/ClBMXg4nowiAJJq7Wj0oO8fg91PtVBdrOg+T5kNbCCF3Oj6hB8D/R9Bl9KIBaV
	 1DN+QgS01Gob3fJ9CD+ENHJdPmQfeJeFYZ+RNHbI9+dWcNlmQrfDuhtrcwLdwkLN2+
	 K1kFBGTz0t3LsssZ5PTsCvr/H0ej0kUpw+MpNC1GQvHeniFQ80RZVhiNJhRaB33wZ1
	 2V2pvAYciwGEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F71B810E9;
	Mon, 15 Dec 2025 21:10:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D267F255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABED740ABE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxRFz_9U3d0s for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB8F740AC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB8F740AC3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA94286FB2; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:50:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f655fc37d711af563d40fbbf6856fae5b5df7980
X-Git-Newrev: 53f80e645586f04e2a5fbe34760211614a1a1495
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.CA94286FB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: bump version
 to 2.4.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53f80e645586f04e2a5fbe34760211614a1a1495
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pdm-project/pdm-backend/releases/tag/2.4.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index 3c7a23b79a..83e275c032 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  6e05613e331b4cb95a973ff99f642bc9  pdm_backend-2.4.5.tar.gz
-sha256  56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b  pdm_backend-2.4.5.tar.gz
+md5  63dd231ba6206cc834b205694208df40  pdm_backend-2.4.6.tar.gz
+sha256  5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532  pdm_backend-2.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index 60299df9a9..4f30f8a909 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.5
+PYTHON_PDM_BACKEND_VERSION = 2.4.6
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/4d/f2/59135ddc68636a33179a37c002abcb162a9811c9ce14469258e486bec012
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/71/fc/15b83c93a8e7929b62debaad63a3e89b8ce7f8a86075bda0d81e42c3cad5
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
