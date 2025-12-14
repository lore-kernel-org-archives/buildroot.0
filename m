Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A736D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB34F60D73;
	Sun, 14 Dec 2025 21:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rB-pLl2QI0TA; Sun, 14 Dec 2025 21:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D49EA60DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747311;
	bh=/fEnwkeGqahqmcslSab2dv6AxPdUKlKc3kebU7hnNPo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lRAcy87/tpPvfTZZCjrQFUBfhngd/Q5lehtk44ZlAQ64556N1zPycY7iknG2NFhiW
	 5KGl3zS5STHWmZcHiTlGgg6eiyqRGOS4HkbId8D3AeiwvUagcRKs/PuWqRqvLqKpCr
	 UnCOw7fqh+y8L7iogjykXdfK55fxgdxD0nU/+EqsMB4WP9fk+3+0X4edBnLYozAmt7
	 H4ZEmf6SyVg9UeyB3pKsR6iBheVv509lkNOnzkH/+PbrZdNXOT3r94WDW+DtCH0HC4
	 s/ewOD83+WAlwmg/4Hl8cJ3Ct0n9/gsGgDJlWKrRUD7WS16B6NobN/tsykrxPxtrQI
	 dnlA1/p5lESJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49EA60DD4;
	Sun, 14 Dec 2025 21:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 115D22D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E16860A3D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnOWP7md8eR7 for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F4760793
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5F4760793
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C56A48355B; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d4fad11e4eabcdd066e0cb9cee0fcccc560bd65
X-Git-Newrev: 17b4876f9bd36e6bb4a0ffadb5e7ea12756627ad
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.C56A48355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dnspython: bump version to
 2.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=17b4876f9bd36e6bb4a0ffadb5e7ea12756627ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://dnspython.readthedocs.io/en/stable/whatsnew.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 4ed5a04270..01ef94b889 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  7a8f6f15038a116598744517931420d0  dnspython-2.7.0.tar.gz
-sha256  ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1  dnspython-2.7.0.tar.gz
+md5  5f2ceb19b1c269f9e1ccef8bf2a1e8c5  dnspython-2.8.0.tar.gz
+sha256  181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f  dnspython-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 2d3622110c..da3cf223fd 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.7.0
+PYTHON_DNSPYTHON_VERSION = 2.8.0
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/b5/4a/263763cb2ba3816dd94b08ad3a33d5fdae34ecb856678773cc40a3605829
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
