Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A52D5B86D
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF65960F08;
	Mon, 15 Dec 2025 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvHQc_KmqWpB; Mon, 15 Dec 2025 21:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D9660F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834729;
	bh=xhMztz9rXXqC2UKMprw30h8FG1kOq47yu+g2bAuVUj8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HBSEds9Dr06QjrP9srkrisVfS8Ct40R9lEcUVmB6XddIdYPRe6Rz+cRe7ufnLwHBn
	 JFJXdC3ddt2NASqKnuF7ToA7dUPttpwVaiAvSe5CJt9adR5m19RGASxeJZWokQhXHK
	 5jQDtWQbOGxL8WNcR+zXFJpRMFooufaYyQYEVRuEMFW/0pWloM38DtyGigpuQ3dg+z
	 hHfxQUNgQg5eH0hAl1igUfn9HrlZzmh26VmA///oJzfwdpDyrxSQJj+dvcTtelDy5c
	 RMQd0Tb2/nyQ9ko4MgWtjfxAvMZIC2EkuPX94xIuXSpok3wM9UGFxIiP2VzkFGMP5H
	 kz2k/+qoNcdAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D9660F0A;
	Mon, 15 Dec 2025 21:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FCA117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38EB94021B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RYirHyitpLD for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 663D140256
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 663D140256
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5766A86FC3; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8a09c557c1c95b4acd0151ef1295aaa1a1320e8
X-Git-Newrev: ee022d365c3ca9e8dc302ef6cf3003d1712a0cc8
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.5766A86FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycairo: bump version to
 1.29.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee022d365c3ca9e8dc302ef6cf3003d1712a0cc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://pycairo.readthedocs.io/en/latest/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index 633b31d975..6f03581ff8 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  12097575a1bb683cab7dc425d9769a68  pycairo-1.27.0.tar.gz
-sha256  5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430  pycairo-1.27.0.tar.gz
+md5  8202d252ea754e2a17852b9031e01b32  pycairo-1.29.0.tar.gz
+sha256  f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142  pycairo-1.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index 8d9459e9e2..fb1d2bac74 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.27.0
+PYTHON_PYCAIRO_VERSION = 1.29.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/07/4a/42b26390181a7517718600fa7d98b951da20be982a50cd4afb3d46c2e603
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/22/d9/1728840a22a4ef8a8f479b9156aa2943cd98c3907accd3849fb0d5f82bfd
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
