Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A310ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2693261360;
	Fri, 27 Mar 2026 10:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VTu3Qvj_zrm; Fri, 27 Mar 2026 10:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6DB613A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605716;
	bh=vkfahyUJYUHNO+g88ynxey4FhzicqHzWWmkiX5bI2ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZEDv+sTeUne/ekSmSOScQ0E6L43rZvTs2JXoa48VgFDCAWtR/2YmGdEgEdXK4yWLU
	 JQuGZf9VoVfZ0H3fmvHpANuKCucTAdaVe04cW/gxMqzArf5WGXb8amftlQ985MDGyi
	 MmsrHSufIhUYHgzhS3jNL3F7nzcWvq/ty4uVc2ns5vvMLZhq14CzlpeHiK8Fbl3Ds5
	 /ItSBxkuMQgXHx6yDSXsat+Edei7miIxosY8YGnVh9u0z3hpl5DAF2D0KmrwuHIHf1
	 cwPG71Xb5MZFliF2l1+zHHAOxpXXen+qKNlDULbL2UVC9RwOOp+3oMmj7HWTOcdE1r
	 lf/xuiASPLLdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6DB613A0;
	Fri, 27 Mar 2026 10:01:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3803249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 530E540BDC
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh12-o8kPfgp for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1B6A40087
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1B6A40087
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28F267FBBB; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:32 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c68605456a33f43634ba5f81595b31de49a72e7a
X-Git-Newrev: 89a8b821956ecc6bf0d4589d913164c2fb9adefd
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.28F267FBBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-tornado:
 security bump version to 6.5.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89a8b821956ecc6bf0d4589d913164c2fb9adefd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/tornadoweb/tornado/blob/v6.5.5/docs/releases/v6.5.5.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e59cc42d2f4b4fd557ceb4fef4b7865da17bf4b7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 53972feb09..1eebd20284 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  bf697c5e3cfb0a572192abf062e83e32  tornado-6.5.4.tar.gz
-sha256  a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7  tornado-6.5.4.tar.gz
+md5  765aacc9cb8931aa66c8f3a83050120c  tornado-6.5.5.tar.gz
+sha256  192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9  tornado-6.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index ab2dd3a334..7b1759bbb6 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.4
+PYTHON_TORNADO_VERSION = 6.5.5
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/37/1d/0a336abf618272d53f62ebe274f712e213f5a03c0b2339575430b8362ef2
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f8/f1/3173dfa4a18db4a9b03e5d55325559dab51ee653763bb8745a75af491286
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
