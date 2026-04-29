Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AFCFF8873
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8BF16075B;
	Wed, 29 Apr 2026 20:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyQTg0uSGulA; Wed, 29 Apr 2026 20:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED8C860EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777496157;
	bh=nJ6Lu9g2cVjkb/hFn4JLwZ1CMANncNemAvmJnnP6O9M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D+DooW2MA3KFCncdxldJ3T4WF8fzmXFCi76+BAfA7QEh2W5meckHAmCyRmtmHI3cy
	 aMG51U4OdEbLdIVHjlD1Ep4OOHpJgbrGbeKD8IPMk3RKjcATXaM4CJ+02FDCUJr1db
	 Ao4QNKcxYPU+ZcA22rb1vGX+AdYDqqYWQ/IA8sAvy4/sn6fUckmnjE85PfpLB5kdF/
	 j3wlnUfdI2yMcXi/YRXN38hLvy7KApfmcqMvU80fzJAeE9ynoQa2uKqSkyZpUASZAP
	 lZXgIPh7dZdYqp6UD2Wo3NYbRNCIWQYlO5lWHFJFC5EfwA+vPWDQ32hgYFygZ8YGCe
	 +41SqFlLpdQnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8C860EFA;
	Wed, 29 Apr 2026 20:55:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D34A18E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F54C8446A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id id4GMvpn-qIR for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FCEF844DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FCEF844DB
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA0CA83BB1; Wed, 29 Apr 2026 20:55:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 22:36:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84c0cb6e9dbc8b3ce11c4482c50f07497f4cd45d
X-Git-Newrev: c87b654e418b191a23220e9d9a4bdf71ec9d1347
X-Patchwork-Hint: ignore
Message-Id: <20260429205551.CA0CA83BB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 2.13.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c87b654e418b191a23220e9d9a4bdf71ec9d1347
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This patch also included the versions with the corresponding changelogs:
v2.13.0b1: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b1
v2.13.0b2: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b2
v2.13.0b3: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b3
v2.13.0: https://github.com/pydantic/pydantic/releases/tag/v2.13.0
v2.13.1: https://github.com/pydantic/pydantic/releases/tag/v2.13.1
v2.13.2: https://github.com/pydantic/pydantic/releases/tag/v2.13.2
v2.13.3: https://github.com/pydantic/pydantic/releases/tag/v2.13.3

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 85fe1c998b..ded810cefd 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  beb5176b58bf266a874ab4d085cdb766  pydantic-2.12.5.tar.gz
-sha256  4d351024c75c0f085a9febbb665ce8c0c6ec5d30e903bdb6394b7ede26aebb49  pydantic-2.12.5.tar.gz
+md5  a6b8098934bfca79f0d99334f975c22a  pydantic-2.13.3.tar.gz
+sha256  af09e9d1d09f4e7fe37145c1f577e1d61ceb9a41924bf0094a36506285d0a84d  pydantic-2.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index dfa30f7a56..71652bed0b 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.12.5
+PYTHON_PYDANTIC_VERSION = 2.13.3
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/69/44/36f1a6e523abc58ae5f928898e4aca2e0ea509b5aa6f6f392a5d882be928
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
