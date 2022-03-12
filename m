Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E08FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE924024A;
	Sat, 12 Mar 2022 17:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGf_35MGA6V4; Sat, 12 Mar 2022 17:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A064021E;
	Sat, 12 Mar 2022 17:03:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 621C81BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D04D4048A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEwwEdCgYaBZ for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F2340488
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:03:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C81AE82A94; Sat, 12 Mar 2022 16:54:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:03:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38c4f6b807e9b519922172089915559fb8642046
X-Git-Newrev: 1f4ea8c95a3e3d6b74276884cfdae51cc8b81857
X-Patchwork-Hint: ignore
Message-Id: <20220312165446.C81AE82A94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: apply host platform
 and project base to pep517 env
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f4ea8c95a3e3d6b74276884cfdae51cc8b81857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The _PYTHON_HOST_PLATFORM and _PYTHON_PROJECT_BASE variables should
also be set for pep517 builds as they are not setuptools/distutils
specific.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index f031bc8fae..52ce402281 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -113,6 +113,8 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 # Target pep517-based packages
 PKG_PYTHON_PEP517_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
+	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
