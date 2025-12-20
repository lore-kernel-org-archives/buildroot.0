Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6417AE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784DB60E1D;
	Sat, 20 Dec 2025 21:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU5BRuqaeYqf; Sat, 20 Dec 2025 21:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E65A160DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266762;
	bh=njaX9PVrabaeD+qanT4QlBxHGxbIaflc0VlJn3SmXdI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MhO3Le23lNjHSPpSrlZkfKswhyOPo3vI+3ZHHoo9oVYL4kgEyD21mdCvY2TJrWfQS
	 dZ1dTiDj1iusshh0pbJHP3fn9jBK6hkbLegZz0jsxiEwKI49Bn8kmYj61yN/AMiY6H
	 +Zki3Yf1w0+eGRELT0yG3rgfIzNgExan1lKosvWOSDjliYN12CXIhx4RdctqWAILm6
	 MrfL2cNs3G9i8isGZ03bZWlPmSieyVNcQxz8uY3qVjG8TxMmTnxoCRs1ovIY/Zdod1
	 VuRB3FRU8TIg8mSVhFkDnBleYXDUr8rhUJNrouIVUFTlBgWWR7YTR6E3jNtxyAgOLB
	 PIJ+zgRvrTJXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65A160DFA;
	Sat, 20 Dec 2025 21:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CBF3119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1350B404A4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSKvKgNMxyVO for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D1540799
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D1540799
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 474B887589; Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 21:32:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 519272ba14eadd43a6e4075a8991847fe4b96966
X-Git-Newrev: 2440dccc67d09a0c41fce75bc25a9156fd667381
X-Patchwork-Hint: ignore
Message-Id: <20251220213917.474B887589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-glslang: bump version to
 16.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2440dccc67d09a0c41fce75bc25a9156fd667381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/KhronosGroup/glslang/blob/16.1.0/CHANGES.md

Supports spirv-{headers, tools} version 1.4.335.0:
https://github.com/KhronosGroup/glslang/commit/209b675bf0c0d82c0e536bcb3cb7e1011957dd59

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-glslang/python-glslang.hash | 2 +-
 package/python-glslang/python-glslang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
index 16b399e542..5b53cd882a 100644
--- a/package/python-glslang/python-glslang.hash
+++ b/package/python-glslang/python-glslang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  172385478520335147d3b03a1587424af0935398184095f24beab128a254ecc7  python-glslang-16.0.0.tar.gz
+sha256  32c605822ed63a0cdc2d24f318c3d912fa14e58573aff1d8eac0cf69f1a6b6d2  python-glslang-16.1.0.tar.gz
 sha256  17e70c676e1521ff3e4686f04a2053d93a7e28a33be8de7ec37ab0ff72feb677  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index 48e5531600..92dc86bf6d 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GLSLANG_VERSION = 16.0.0
+PYTHON_GLSLANG_VERSION = 16.1.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
