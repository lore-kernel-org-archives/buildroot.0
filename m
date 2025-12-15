Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC57D5B872
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402F981DF8;
	Mon, 15 Dec 2025 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIzYZBlMvdvA; Mon, 15 Dec 2025 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5346081DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834731;
	bh=YLPNb0+/5rOsWltfuc8/mi0fUgpTN3NphKvhAK3sVxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sR5kMRkvEOxA9Li/tM5kMGLqbKANkCqqTCqrK075nIDjigLokNJTy//B8wShr0qcS
	 O52aVvZiuhTfRCp4xQPtl35gK94Vy9qtqZ8ffkB4p1hLsSCfVRc8NBcpRrX8v5sFMp
	 xkigp+0gT458PghcDS1s8VJnRTbYQAtAX8ofkezla/5Zuq1w7uqWqoFJrJwFGnm6Pg
	 P75m0K/kKOWGkSS4/pXGhlOwSGxCKap7EOjA5YdRO6CjdmyiBMCkj3ZGeepnOsg24J
	 mQAndKtUQc+lngrkmdIwg8+fu7wJBWtLI4FGNGAP0w5P0t11sBSmZmhZWNCB5LKruq
	 6CIBPZGgfXeBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5346081DFF;
	Mon, 15 Dec 2025 21:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77AB9117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA1BD81DF8
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dke-Z_VXnsIH for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE5D81DE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AE5D81DE3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3767186FC3; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8da8d036beef9312adf55e28238164c3d9c16705
X-Git-Newrev: b6cb9f0918c83d9c1f4f8b4181770314ed1e1d6a
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.3767186FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-propcache: bump version to
 0.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6cb9f0918c83d9c1f4f8b4181770314ed1e1d6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/aio-libs/propcache/blob/v0.4.1/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 6e89eac6aa..347f232927 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  1c073b491620a9f6d568276d61f80277  propcache-0.3.2.tar.gz
-sha256  20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168  propcache-0.3.2.tar.gz
+md5  9efab9358cf05265dbee69297e0de96a  propcache-0.4.1.tar.gz
+sha256  f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423c97c3d  propcache-0.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index e1050c4919..88d1f2cfba 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.3.2
+PYTHON_PROPCACHE_VERSION = 0.4.1
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a6/16/43264e4a779dd8588c21a70f0709665ee8f611211bdd2c87d952cfa7c776
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf63743258bff22b3dfa7ea5baef7b5bc324af47a0ad89b8ffc6f
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
