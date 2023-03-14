Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C0CC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0FF81BE3;
	Tue, 14 Mar 2023 07:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0FF81BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q86UGhPfKjkX; Tue, 14 Mar 2023 07:28:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6AF815CC;
	Tue, 14 Mar 2023 07:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B6AF815CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0FA11BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89CF9405C5
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89CF9405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcYBvGmKwOdI for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:28:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB6F34011F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6F34011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2CDC870DD; Tue, 14 Mar 2023 07:28:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 08:26:12 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 97d63629fc12a5551a74cc735115524d44d1fdbf
X-Git-Newrev: eecb4a6630ada80c96d9544282c3bdb8f42a55f7
X-Patchwork-Hint: ignore
Message-Id: <20230314072822.A2CDC870DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/lirc-tools: fix
 python build
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

commit: https://git.buildroot.net/buildroot/commit/?id=eecb4a6630ada80c96d9544282c3bdb8f42a55f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 6ec2a9d4383b3370da39d70805b7c7854cefeded)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
