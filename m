Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42237D66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5464B61117;
	Wed, 17 Dec 2025 21:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19Yk2crwByIS; Wed, 17 Dec 2025 21:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C14C61131
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007903;
	bh=l85BMhsFK2HP2XGmoVu82Y2PN712SMv9BcirJK2VLb0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=chsmIILwrqPtt+UJDyiuHQWw46AzjpPjpnVnbQ1RuCCRXA8nqHQVx4qawJTiepW6d
	 9wxXuFr0x9xNN6xevss08HX3JR74bW5+hWeLLXPd47O2hGRGh70u9ur9h7eA3hXvrb
	 l5CCoGzFNw8cYnBMu7TaLvIHVJYYHL4SsOFTkysLaHAHXb4dSQpOYMGayjoYeJw6r7
	 tcIx5Ue1TIxOMYjEENgQnIZy+IETb47lni6NdBgaj5wF/HdmbhtuSocApgkx80Dugl
	 nGv4qHTyvWntz7IuZTr+tOdvf6d8wsYeLnWIvNrWBcNe7nn34tqx6S1YhjecBiBgbT
	 WTT+OG8TZ+ZuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C14C61131;
	Wed, 17 Dec 2025 21:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD0FD432
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B068440F89
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLqxartzLkvs for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBAAC401A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBAAC401A0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB4468120D; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8051485bbc1efcf8cc52983ac57a9b66cc21a06f
X-Git-Newrev: 12e20ab68b3ab54957a1b2a0ed7bdbc513fd4373
X-Patchwork-Hint: ignore
Message-Id: <20251217214457.BB4468120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tinycss2: bump version to
 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=12e20ab68b3ab54957a1b2a0ed7bdbc513fd4373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Kozea/tinycss2/blob/v1.5.1/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index 4a7b26de82..2ffb280506 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  de6bd20b47354352c2b2344c842385c7  tinycss2-1.4.0.tar.gz
-sha256  10c0972f6fc0fbee87c3edb76549357415e94548c1ae10ebccdea16fb404a9b7  tinycss2-1.4.0.tar.gz
+md5  003d9f446bddb3dfc76d0f3db0f38fea  tinycss2-1.5.1.tar.gz
+sha256  d339d2b616ba90ccce58da8495a78f46e55d4d25f9fd71dfd526f07e7d53f957  tinycss2-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index b269617ad1..39029278a7 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.4.0
+PYTHON_TINYCSS2_VERSION = 1.5.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/7a/fd/7a5ee21fd08ff70d3d33a5781c255cbe779659bd03278feb98b19ee550f4
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/a3/ae/2ca4913e5c0f09781d75482874c3a95db9105462a92ddd303c7d285d3df2
 PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
