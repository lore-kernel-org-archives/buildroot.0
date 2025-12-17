Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4BDD65C63
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACFAB40F77;
	Wed, 17 Dec 2025 21:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuZrDLxH4FDO; Wed, 17 Dec 2025 21:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF48840F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007904;
	bh=9pAT5PGdSPQhfN9MhjWL4UX5uSLv/ILP2+X5wpXLB/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LOkjrOzh8l4q0RNcpF4Qi8vg9g2n4MWpcf+lN12HTRHI3Wtah7/ReB/YsC0kx4ShM
	 ZGieYbYinQ+R+VMjZI+vcK/XkmiD8zNBDzXJ3ka8Rap6XvpXk6Dux88R4pxcoTDI8p
	 LfawQtOqBrmOQAQsgZ47ULWk+fPEVxveMI5x2JT5A2DA3PWPfiQblfHmeeA41ieKAG
	 K/WVESObXtabJJk22rCirptz1kchhiVNfvjyniploI6uI7dI4C5gAu3Est31Jxs93B
	 3JP+/MqxPIrFUs1D1Rh0U0xTRsP82X0lZaz+u97yGqEpE+DoXdjqpQwk9+Ahcjz7p2
	 9GBzZTpGM9mcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF48840F6C;
	Wed, 17 Dec 2025 21:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F02375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB88401A0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVnoCZhBmqtu for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1795640F7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1795640F7C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 165CB8120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7440e901d3eb39ab9be6e6493749eb28d0d8710d
X-Git-Newrev: ae6ff907b6f1583398c9299ef8713eee5a617de5
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.165CB8120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: bump version to
 25.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae6ff907b6f1583398c9299ef8713eee5a617de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/twisted/twisted/blob/twisted-25.5.0/NEWS.rst

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/662f2a9b0563cd7a0f6acf0ed92891ae2cd7e1f3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 436f4c48a7..f3cf53bcaa 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  a21b5326a74079a92d7bc4748b419280  twisted-24.11.0.tar.gz
-sha256  695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5  twisted-24.11.0.tar.gz
+md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
+sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
+sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index b7217da6e4..8db5d3750c 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 24.11.0
+PYTHON_TWISTED_VERSION = 25.5.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/1c/e07af0df31229250ab58a943077e4adbd5e227d9f2ac826920416b3e5fa2
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
