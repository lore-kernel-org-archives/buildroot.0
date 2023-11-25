Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE9C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 912E541899;
	Mon,  4 Dec 2023 20:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 912E541899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SiYDyW_PqB41; Mon,  4 Dec 2023 20:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FED41953;
	Mon,  4 Dec 2023 20:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FED41953
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1161D1BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A7F541768
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A7F541768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnYO1D7Y63C7 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DD904011A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DD904011A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B6F6879BA; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:03:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b915358babe37a721b4f6e032ec884174bd6e0b
X-Git-Newrev: bfafe9b3e9c5a5ae7767c534dccca2d14e50b41c
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.5B6F6879BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: remove references to
 PKG_PYTHON_*_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfafe9b3e9c5a5ae7767c534dccca2d14e50b41c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These variables were removed. In addition, the text describing them
wasn't terribly useful. Just remove the sentences describing them.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-python.adoc | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 500967f235..33dbfc30a5 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -135,25 +135,13 @@ therefore only use a few of them, or none.
   makes sense to use for distutils/setuptools based packages as
   flit/pep517 based packages do not pass these options to a +setup.py+
   script but instead pass them to +support/scripts/pyinstaller.py+.
-  For target distutils packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+
-  options are already passed automatically by the infrastructure.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
   to the Python +setup.py+ script (for distutils/setuptools packages)
   or +support/scripts/pyinstaller.py+ (for flit/pep517 packages) during
   the target installation step, the staging installation step or the
-  host installation, respectively. Note that the infrastructure is
-  automatically passing some options, defined in
-  +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
-  packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
-  distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS+ (for target setuptools
-  packages), +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
-  setuptools packages) and +PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS+ or
-  +PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS+ (for target flit/pep517
-  packages).
+  host installation, respectively.
 
 With the Python infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
