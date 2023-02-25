Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4CBC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 20:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAA8B40BB8;
	Sat, 25 Feb 2023 20:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAA8B40BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QA3xjZObVSrR; Sat, 25 Feb 2023 20:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B51640BBF;
	Sat, 25 Feb 2023 20:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B51640BBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683831BF865
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 429FB402C2
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429FB402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySwiCFIiPKZb for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FBC3402A6
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FBC3402A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B25586AE8; Sat, 25 Feb 2023 20:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 21:49:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e608885a2df51ba77378f210f4c0e8cb59d5b8b
X-Git-Newrev: 6ec2a9d4383b3370da39d70805b7c7854cefeded
X-Patchwork-Hint: ignore
Message-Id: <20230225205333.2B25586AE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lirc-tools: fix python build
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ec2a9d4383b3370da39d70805b7c7854cefeded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.10.2 in
commit 58cc3977e83487bdaa1df232cf7adf6383d49cd7:

In file included from /home/thomas/autobuild/instance-3/output-1/per-package/lirc-tools/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/python3.11/Python.h:38,
                 from lirc/_client.c:1:
/home/thomas/autobuild/instance-3/output-1/per-package/lirc-tools/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/85359d3f678b49e46821a1c10da5f14edfb5e6d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lirc-tools/lirc-tools.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 5263330741..a3ad6bd5a0 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -48,7 +48,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIRC_TOOLS_DEPENDENCIES += python3 host-python-setuptools
-LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
+LIRC_TOOLS_MAKE_ENV += \
+	CC="$(TARGET_CC)" \
+	SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
 endif
 
 define LIRC_TOOLS_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
