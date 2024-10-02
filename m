Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C499CF8541
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03F50413E1;
	Wed,  2 Oct 2024 21:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHIXAjkJr-D0; Wed,  2 Oct 2024 21:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDB8413F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DDB8413F0;
	Wed,  2 Oct 2024 21:02:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82DFB1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E8E960772
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hv_i-Xz5zNYU for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4CA606C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4CA606C4
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3860784A17; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:01:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77998c8d9385e2c421b2f99fb074f2968461ef3c
X-Git-Newrev: 62e24c548bd894ff095670fc91620476d8cd3ae1
X-Patchwork-Hint: ignore
Message-Id: <20241002210218.3860784A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.13.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62e24c548bd894ff095670fc91620476d8cd3ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required --skip-dependency-check build option as
upper setuptools version is no longer pinned:
https://github.com/sqlalchemy/alembic/commit/9d6e212b77c8ce5ea1164b6d67f2ba491beba413

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 6cfd327f6e..c03236a105 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  0118e72e5ffaf9752d995fa7d6c2a565  alembic-1.13.2.tar.gz
-sha256  1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef  alembic-1.13.2.tar.gz
+md5  c56a6402b0601a8c2d844a08928d752f  alembic-1.13.3.tar.gz
+sha256  203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2  alembic-1.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 79ec56ab65..a1e45630a3 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.13.2
+PYTHON_ALEMBIC_VERSION = 1.13.3
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/66/e2/efa88e86029cada2da5941ec664d50d9a3b2a91f5066405c6f90e5016c16
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/94/a2/840c3b84382dce8624bc2f0ee67567fc74c32478d0c5a5aea981518c91c3
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-PYTHON_ALEMBIC_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
