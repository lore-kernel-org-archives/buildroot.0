Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2674DD5B870
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF93240AEE;
	Mon, 15 Dec 2025 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3leTKau8IpdO; Mon, 15 Dec 2025 21:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1813E40AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833014;
	bh=cbR+otpTDEBj1MN10xj+LbA5jHtZ9gLxMZirSC2wJ7k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rKn+fNzGMZYoWbpDZ17mxGMNcezO68lB5ZCeSPTaCs9J2qqv+cZ33XZa17IB9dMqT
	 pmeo7sjqzAmo9AnK8FrTHD/F6ZovwMGYzw8Tv9iQTcxwT/OCjemijWnn0KZRZPiLLh
	 grHmgyq3hXJO6C0DaM0YrsuiC9b4WwEXzJgrwMVhS4HpL7qPoHbokyE9VFyws47tP4
	 qmPS4JS8GXyZ4lvxOT//iYMThARu5t+ys9cppVX9xWXXKu062fNg41ymSmInSi5vy4
	 Bwp4tF0AbwfeafkgRTijjQHjMgh/AKUVeulffY+409jALoBZWTVfhbQ4+MYyE4LK5J
	 9Vsav/WU3cJfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1813E40AFD;
	Mon, 15 Dec 2025 21:10:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32601151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EFD880FAF
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoCF8gQBuNPC for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43A080FBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C43A080FBA
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C31E186FB0; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:49:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06af8b8551ccaa890c63f277b835c0c53176e80f
X-Git-Newrev: f655fc37d711af563d40fbbf6856fae5b5df7980
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.C31E186FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-networkx: bump version to
 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f655fc37d711af563d40fbbf6856fae5b5df7980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/networkx/networkx/blob/networkx-3.6.1/doc/release/release_3.6.rst
https://github.com/networkx/networkx/blob/networkx-3.6.1/doc/release/release_3.6.1.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-networkx/python-networkx.hash | 4 ++--
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index bd8326f104..5c39a1ebbf 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  9d5221bbc2eca0190663e887b91e75c6  networkx-3.5.tar.gz
-sha256  d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037  networkx-3.5.tar.gz
+md5  eb7fada9285b28cc9d6327c19240a793  networkx-3.6.1.tar.gz
+sha256  26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509  networkx-3.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3cf7c3a179d817b23b8b8568211769fefdf93797d207d984b8b2fa24d0220b33  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 41d33f1560..d2495590be 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.5
+PYTHON_NETWORKX_VERSION = 3.6.1
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6c/4f/ccdb8ad3a38e583f214547fd2f7ff1fc160c43a75af88e6aec213404b96a
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
