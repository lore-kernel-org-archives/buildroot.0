Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C31EC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF94481E21;
	Sun, 16 Feb 2025 12:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fy8BK8-dPrdT; Sun, 16 Feb 2025 12:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85B683330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85B683330;
	Sun, 16 Feb 2025 12:02:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8606BC8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6873A401F6
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3DRmm46j7l2 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A2940284
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A2940284
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:02:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D27187627; Sun, 16 Feb 2025 12:02:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 12:47:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bc3bbce3873667c229d8b16552f58045ee3c439
X-Git-Newrev: e2870d7669aa3006780c7d672cd7b51499e1d396
X-Patchwork-Hint: ignore
Message-Id: <20250216120218.2D27187627@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-evdev: bump to version 1.9.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2870d7669aa3006780c7d672cd7b51499e1d396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "package/python-evdev: bump to version
1.8.0", python-evdev is failing to build with error:

    evdev/ecodes.c: In function 'PyInit__ecodes':
    evdev/ecodes.c:65:29: error: 'BUS_AMD_SFH' undeclared (first use in this function)
       65 |     PyModule_AddIntMacro(m, BUS_AMD_SFH);
          |                             ^~~~~~~~~~~
    /home/autobuild/autobuild/instance-8/output-1/build/python3-3.12.8/Include/modsupport.h:61:70: note: in definition of macro 'PyModule_AddIntMacro'
       61 | #define PyModule_AddIntMacro(m, c) PyModule_AddIntConstant((m), #c, (c))
          |                                                                      ^
    ...

Upstream commit [2] included in this version fixes issues when
building wheels.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/9085451384
- https://autobuild.buildroot.org/results/61a3b74e60f2f0f93e312803812ab4d98c492599/
- and many others...

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/455ef44d26f027abc1936ba9041427a4b2e86f42
[2] https://github.com/gvalkov/python-evdev/commit/3ff9816e08be95b331ea9dadc18fc17f1e04e272

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[Julien: reworded the commit log to add extra info]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index d31e236989..733c0c9cda 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  a38ac9e2297940430bb27cea41be964e  evdev-1.8.0.tar.gz
-sha256  45598eee1ae3876a3122ca1dc0ec8049c01931672d12478b5c610afc24e47d75  evdev-1.8.0.tar.gz
+md5  c1440732b435dad5796bbb8e91d0340b  evdev-1.9.0.tar.gz
+sha256  38218bc95507cad756bc621a5fe7a77a41eb8d9c1213855de8e4ba0aba28e79f  evdev-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index f465aff933..d24974a037 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.8.0
+PYTHON_EVDEV_VERSION = 1.9.0
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/4c/eb/b8900082a13a47bb9f69f415174d03cbf12ce95d07345722e1f4ef0e2093
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/8c/bf/0fe4d372ee62fe5aec06aae2e97c0603d131b8e3cbaffa2329e0bd763a98
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
