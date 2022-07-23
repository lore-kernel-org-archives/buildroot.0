Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE8C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E5240920;
	Sat, 23 Jul 2022 16:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E5240920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wJiMIn-2CSf; Sat, 23 Jul 2022 16:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25D53404DF;
	Sat, 23 Jul 2022 16:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D53404DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 444D11BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F99C84B7E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F99C84B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9XAAHo3Lvzw for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:41:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 015C484B1F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015C484B1F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B9CAC846EE; Sat, 23 Jul 2022 16:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:41:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f704ec56f85b4aebb75a76fd7dbd9db800bf1b9e
X-Git-Newrev: b7c65d505c0cc440f327267aa5ad6ef3d06c858a
X-Patchwork-Hint: ignore
Message-Id: <20220723162816.B9CAC846EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyalsa: bump to version
 1.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7c65d505c0cc440f327267aa5ad6ef3d06c858a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.2.6, see:
- https://github.com/alsa-project/alsa-python/releases/tag/v1.2.7

This commit also changes the download protocol from FTP to HTTPS,
following the upstream project download page. See:
- https://www.alsa-project.org/wiki/Download
- https://www.alsa-project.org/main/index.php?title=Download&diff=7455&oldid=7386

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyalsa/python-pyalsa.hash | 2 +-
 package/python-pyalsa/python-pyalsa.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index 655150a649..d4cfe0d61f 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  327b29bad57b049571e3d1f63281fdd21df27447cb5e2eadf46b737fbcff6e69  pyalsa-1.2.6.tar.bz2
+sha256  67d8f99f1ccf23e7ebdfa2c3be0b09f147949fd9511d1e6748b7f412ef046e1f  pyalsa-1.2.7.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 10d5293c2c..cc5e2ec9a0 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.2.6
+PYTHON_PYALSA_VERSION = 1.2.7
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
-PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
+PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = distutils
 PYTHON_PYALSA_LICENSE = LGPL-2.1+
 PYTHON_PYALSA_DEPENDENCIES = alsa-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
