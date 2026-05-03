Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CADACD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02094612A7;
	Sun,  3 May 2026 14:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKUX89wg9iA9; Sun,  3 May 2026 14:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF3C6136C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819860;
	bh=5mUMnCL/yAl+4QZ5Dz0ZLUiSzoJg+IAGUMj49lfOSeg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d1dAJwdqW0QlwTZ2+Llti5sbMtTIYcVoVBDg/9+RCOudCSvdtGAxvR4uiUu9pCs8y
	 I7FG4RyV/4QHV5GaVJu+Vy4aLQ6/fC4Yk+QCoEVqPbvacV27e5ZyEij53NYJWyWbY5
	 g62R4rvLVnR0g0uMgiB4UGBGiPM4bztWywZll5ZHmoV5daPSu6PH5rkAnIeDfIZKlx
	 uPFdiPCux3Nj5b3EVtVs4BHPF7ORJKQb4dD+UFzKu3MeW93hTqgVetyqla25KiD1eg
	 bkWDbxFme/JAelgH0nstOTe9dbcm1JLJXRqh9Eid4ouM6PIw8gUker7NBJLXeflxMy
	 jZNxlXBXXGiwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF3C6136C;
	Sun,  3 May 2026 14:51:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E2C392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCAE26127B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foFc8O0qDeF1 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36D16128D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F36D16128D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF0E683E54; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 889f971d39d9b412b5b5dcd7fbe2364d3cc4ea05
X-Git-Newrev: f6045bd27c528a96cc68cb7d6aebb249610665ac
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.AF0E683E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: bump version
 to 2.4.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6045bd27c528a96cc68cb7d6aebb249610665ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pdm-project/pdm-backend/releases/tag/2.4.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index c856d1e818..d9e1364adb 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  f51ca7c104f47dac6b31dc51255fab19  pdm_backend-2.4.7.tar.gz
-sha256  a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f  pdm_backend-2.4.7.tar.gz
+md5  20119cc4fe88d92eef4ac48ab18ff69e  pdm_backend-2.4.8.tar.gz
+sha256  d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0  pdm_backend-2.4.8.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index c3cfeb6f73..b02154128c 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.7
+PYTHON_PDM_BACKEND_VERSION = 2.4.8
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/e2/38/d22c1050130b8cdf16fef76c99c59968086802744947f2813d45c69cca52
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/7c/7e/6d441c8739a30820ec59517a88326789c201ae43a344b2ffb02fb2702d8e
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
