Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2184CCD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF7A041348;
	Fri, 12 Jun 2026 20:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDeMapqNLqHm; Fri, 12 Jun 2026 20:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019C241349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781296997;
	bh=T08yuPgEIma9gVnliY0JgmBLAe1xWqAdwJkd7sXzgVM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xr59B4w+85Mkul9mpF8o5OF9d6+D9sLAWU4uiBs0itrowLgUiwnTasRgyxzH8SliR
	 dUejQoR1hTGAdmRzcA9nSsQA1AMkSyW7PsKp+ny1dmpC4GZ39bPspCwNhf9pBZ424S
	 KYqmvMeJsA/lhuy9+zPufB8vEK6FbBWLNqIjoLIhHEDRWkrgdDpcnIBoxuE2guFdVT
	 kg5ELb6P1cjVkLLFfMIHGa/E3aLQ1cnLmGLzLbewvcXQUn8J3UhP0HqYDdENrrkH/M
	 VkpxlWr+9ImWMxBzUXe0oa6cUTC2x8uBKHRQahhBmN7L/MbK810hJAR0WgR55VaheB
	 WmHCUjnVmXEfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019C241349;
	Fri, 12 Jun 2026 20:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2F741E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B3F40D7F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A9gdSDlJWjC for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280654033F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 280654033F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:43:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C066C88111; Fri, 12 Jun 2026 20:42:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 22:38:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28eeca9a988441dc55ab4a78da83cd58bffafa53
X-Git-Newrev: fb81861aff4b8407f32cb22e17f02e07a5439780
X-Patchwork-Hint: ignore
Message-Id: <20260612204255.C066C88111@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aenum: bump version to
 3.1.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb81861aff4b8407f32cb22e17f02e07a5439780
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aenum/python-aenum.hash | 4 ++--
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index dcef45a701..9404b9ca70 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aenum/json
-md5  2e00e2da1c6a2aa8b6a8fae85292e44a  aenum-3.1.16.tar.gz
-sha256  bfaf9589bdb418ee3a986d85750c7318d9d2839c1b1a1d6fe8fc53ec201cf140  aenum-3.1.16.tar.gz
+md5  bd988607bd8bc8ee4d352b4cb33b913a  aenum-3.1.17.tar.gz
+sha256  a969a4516b194895de72c875ece355f17c0d272146f7fda346ef74f93cf4d5ba  aenum-3.1.17.tar.gz
 # Locally computed sha256 checksums
 sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 4b59216722..49cba84990 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 3.1.16
+PYTHON_AENUM_VERSION = 3.1.17
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/09/7a/61ed58e8be9e30c3fe518899cc78c284896d246d51381bab59b5db11e1f3
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/07/e9/8b283567c1fef7c24d1f390b37daede8b61593d8cdaffb8e95d571699e83
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
