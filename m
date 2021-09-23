Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A426AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0FB460F43
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 16:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0FB460F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFB5840CE;
	Thu, 23 Sep 2021 16:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPYHyzYG8cPt; Thu, 23 Sep 2021 16:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E54D8840BD;
	Thu, 23 Sep 2021 16:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6E181BF5DD
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1AFB40718
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 16:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1pgSvxnOmBM for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 16:45:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 657124071B
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 16:45:56 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TRr7mmlAZa4UMTRr8mfLWn; Thu, 23 Sep 2021 18:45:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632415554; bh=pTpnxZPBRZv5PW5zk/WckjcAEJONVIN0/TXYy0U66ZA=;
 h=From:To:Subject:Date:MIME-Version;
 b=dmZw/sEj8HBpJGfyI37WCfxSkc8UCJ/BAh9L2X0m9nX8pDzmqs5wNSiS7xNfWI2Rb
 DGh2jVAs+L+fpSTNdG6Cnt7CIMQci0wo7Cwxifuy5bNnuxBtkev5XbLqcWohHpWOCP
 IjFj+YgDn+YRGk1fJhStxeW7r9zMoukdT5vISv/UimjyFqNeE3beRlLk5H3CdPlfdC
 LFDUJd7pfJ2vrenSRrjlqkGWW+qTa0yODqmmOIPvFGieo6sGIddSn7FFhoC+TbKwkT
 PR/QxaJURgQnk/eoc24oQr6GON/8iCWAl4DQ328Y1tJPBL6849l/6X4yp1lzffwOZO
 Ue5Ba1Y1XC7gg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 18:45:53 +0200
Message-Id: <20210923164553.1218801-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923164553.1218801-1-giulio.benetti@benettiengineering.com>
References: <20210923164553.1218801-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFZzPXTsagF743z6Ub7y7SZfH1PL8d8bGi2/f5dMQvDP5rZFLAODDpqQ2+YhM6GvI2ZTvrKfnzK8LmeugkiKoZ3ZoL94eTqioYEgPl3CZ0P1k/o4a8HW
 9geGbLIVMr6QBA0GxT9kg9hY5ODJF6RcKDRCR5OsVkvYnqYHycIkBo34bxa4kq2S74c/HFC3H//RMuyWy8PMU23qXABmvNbdr+suRO0tAb9N4huQy/LsSiGN
 HN8LfNMSE6Eht+rIEwLyjamuY0WcrIqqLqhz5jJLDmWSgOZ3+4dQVzkJqe6MEfC8pFFo7pBaiL/4oBWqwLdDbv2r0SoI7YTx2B7Dezy34HLt5MK+X0ZNl98E
 79dqKncl4JFoWOoVN/eHyvyXxqGpuvdHNKmoLLXBlHm0dTtfwUZD6o4G69N/0vaSMXyJ+YAYst8OlDIigkXdl3UwC5Tajt9ughSc0RNppWZT8ExDcsM=
Subject: [Buildroot] [PATCH 2/2] package/python-uvloop: work-around m68k
 toolchain infinite loop
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add patch[1] to allow overriding the default -O2 flag always appended at
the end of the python Extension. This is needed to pass -O0 to gcc to
work-around the gcc bug 102472. So when
BR2_TOOLCHAIN_HAS_GCC_BUG_102472=y let's pass -O0 to MODULES_CFLAGS

Pending patch:
[1]: https://github.com/MagicStack/uvloop/pull/443

Fixes:
http://autobuild.buildroot.net/results/17d/17d6e6422abadcd6313c430c40f2a5d7162dbbd3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...allow-to-override-extra_compile_args.patch | 42 +++++++++++++++++++
 package/python-uvloop/python-uvloop.mk        |  4 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/python-uvloop/0001-setup.py-allow-to-override-extra_compile_args.patch

diff --git a/package/python-uvloop/0001-setup.py-allow-to-override-extra_compile_args.patch b/package/python-uvloop/0001-setup.py-allow-to-override-extra_compile_args.patch
new file mode 100644
index 0000000000..94f1ecf93d
--- /dev/null
+++ b/package/python-uvloop/0001-setup.py-allow-to-override-extra_compile_args.patch
@@ -0,0 +1,42 @@
+From b415e5175500117950f56b5eded1e82acac49c16 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 23 Sep 2021 16:47:55 +0200
+Subject: [PATCH] setup.py: allow to override extra_compile_args
+
+At the moment extra_compile_args is set to -O2 by default. But m68k
+toolchain has a bug that when trying to build Extension uvloop.loop enters
+an infinite loop1. So we need to override -O2 with -O0 to make it
+work. So let's getenv('MODULES_CFLAGS') and assign it to local
+MODULES_CFLAGS (former CFLAGS) and assign it to extra_compile_args. If
+not MODULES_CFLAGS is found then -O2 is kept as default.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index eae4910..ec23d13 100644
+--- a/setup.py
++++ b/setup.py
+@@ -55,7 +55,7 @@ EXTRA_DEPENDENCIES = {
+ 
+ 
+ MACHINE = platform.machine()
+-CFLAGS = ['-O2']
++MODULES_CFLAGS = [os.getenv('MODULES_CFLAGS', '-O2')]
+ _ROOT = pathlib.Path(__file__).parent
+ LIBUV_DIR = str(_ROOT / 'vendor' / 'libuv')
+ LIBUV_BUILD_DIR = str(_ROOT / 'build' / 'libuv-{}'.format(MACHINE))
+@@ -301,7 +301,7 @@ setup(
+             sources=[
+                 "uvloop/loop.pyx",
+             ],
+-            extra_compile_args=CFLAGS
++            extra_compile_args=MODULES_CFLAGS
+         ),
+     ],
+     classifiers=[
+-- 
+2.25.1
+
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index ff98d747b2..a0dc554aae 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -14,4 +14,8 @@ PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
 PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
 PYTHON_UVLOOP_DEPENDENCIES = libuv
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_102472),y)
+PYTHON_UVLOOP_ENV = MODULES_CFLAGS="-O0"
+endif
+
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
