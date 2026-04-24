Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDB6FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E4A684DDC;
	Fri, 24 Apr 2026 16:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uA-Calm_Vmsd; Fri, 24 Apr 2026 16:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1838E84DD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049638;
	bh=gBuFjThfu5l/y56tlrxyaN9hUOcDhpUiSxvia0XKKoA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d9+R/8zdnrFV8foYtIBC7nCOiDO94/5XWGRyEsAnoUyc6lvW9ybh6qGO/z5PTFrLY
	 UrPH8qi+g5hhDkwgAzlrcMaobj9Cyi29q5+MKf7UneziiEqwwK5MvPMzK8NVk8AdNm
	 yf2iF63MyKswHGPqBXbYcmz+4ox+xQL7hJ5pTeI5VTZnhAYmMKhej87nJZt6cCywa7
	 6XvlDhF9PW9VbEvB9j/uVtaFTSc195MNh0/8vKKfkx+RvrJL6ealhmoWCO3P6Fi1cH
	 tpUbc9hcqbP7c4LVOPEDw5qMkfLsFgL6EpVxAWinF+M4BpOZ7YWeQAH9MnzGmMC1dx
	 O0YH4960qSunQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1838E84DD1;
	Fri, 24 Apr 2026 16:53:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1005024D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01BD14297A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlOO6OKOK-Qu for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 297C242972
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 297C242972
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:53:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D159782AFA; Fri, 24 Apr 2026 16:53:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:48:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7ebed6df01e2d3395843ba39297359ae5498fd1
X-Git-Newrev: 373f2b7d628251d689df082a5f96752e9b560608
X-Patchwork-Hint: ignore
Message-Id: <20260424165354.D159782AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-caching: bump version
 to 2.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/373f2b7d628251d689df082a5f96752e9b560608
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-caching/python-flask-caching.hash | 4 ++--
 package/python-flask-caching/python-flask-caching.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-caching/python-flask-caching.hash b/package/python-flask-caching/python-flask-caching.hash
index ee3f669934..cc799fa47c 100644
--- a/package/python-flask-caching/python-flask-caching.hash
+++ b/package/python-flask-caching/python-flask-caching.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-caching/json
-md5  026d06167ba7353ac65c861950ad5696  flask_caching-2.3.1.tar.gz
-sha256  65d7fd1b4eebf810f844de7de6258254b3248296ee429bdcb3f741bcbf7b98c9  flask_caching-2.3.1.tar.gz
+md5  5e628f2a989e60fa99b154515d1e2499  flask_caching-2.4.0.tar.gz
+sha256  a7f14e43617cd0612a57bec2f80516d6d2ec888bfc50a807b1e4e41ca345a3b5  flask_caching-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f3c445faa26eb32d90291228510e2d8594bd1fe15463f5d70c87d44f38872fd  LICENSE
 sha256  7729328f7b1ce664dbf630f077581cdfe97379b58b49e9a4f20c63912a5e5c09  docs/license.rst
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
index db305d3dde..0b32c87055 100644
--- a/package/python-flask-caching/python-flask-caching.mk
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CACHING_VERSION = 2.3.1
+PYTHON_FLASK_CACHING_VERSION = 2.4.0
 PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
-PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/e2/80/74846c8af58ed60972d64f23a6cd0c3ac0175677d7555dff9f51bf82c294
+PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/42/53/5c46b6a80adc13ed9179879a93cfc2c1f190c64c48ba732b4f5819df520e
 PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
 PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
 PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
