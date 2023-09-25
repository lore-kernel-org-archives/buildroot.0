Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73431CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 12:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BABF6104D;
	Mon, 25 Sep 2023 12:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BABF6104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rY6dIduDecC9; Mon, 25 Sep 2023 12:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2C5610AD;
	Mon, 25 Sep 2023 12:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2C5610AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDBEC1BF947
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5C8A417FF
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 12:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5C8A417FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huWtDaRkImh9 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4FEE417A9
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4FEE417A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DD0587745; Mon, 25 Sep 2023 12:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:51:54 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 276c7d50da98bf1f379a78c0bad412e788191256
X-Git-Newrev: a199417dd8d2c19dc046efa5f85b62ce21b828aa
X-Patchwork-Hint: ignore
Message-Id: <20230925120252.8DD0587745@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/zxing-cpp: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a199417dd8d2c19dc046efa5f85b62ce21b828aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix the following build failures raised since bump to version 1.4.0 in
commit 456a7398316655ad0b669635f580e4887c24a700:

-- Found PythonInterp: /usr/bin/python3.6 (found suitable version "3.6.9", minimum required is "3.6")
CMake Error at /home/buildroot/autobuild/run/instance-3/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/share/cmake/pybind11/FindPythonLibsNew.cmake:147 (message):
  Python config failure:

  Traceback (most recent call last):

    File "<string>", line 6, in <module>

  ImportError: cannot import name 'sysconfig'

and

In file included from /home/buildroot/autobuild/instance-1/output-1/host/include/python3.11/Python.h:38,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/numpy.h:12,
                 from /home/buildroot/autobuild/instance-1/output-1/build/zxing-cpp-2.1.0/wrappers/python/zxing.cpp:18:
/home/buildroot/autobuild/instance-1/output-1/host/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/665b246a4bb14480152ee59050672a7469148a5b
 - http://autobuild.buildroot.org/results/0502b05020de57e4910125c699c4264047187c51
 - http://autobuild.buildroot.org/results/c5e7fe83d46c704e05800e3ae62bf476458c7b71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 38f39a603167148476684254a57372a5f4ac8e09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zxing-cpp/zxing-cpp.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 1051376808..85836924b9 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -33,7 +33,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
 ZXING_CPP_DEPENDENCIES += python3 python-pybind
-ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
+ZXING_CPP_CONF_OPTS += \
+	-DBUILD_PYTHON_MODULE=ON \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
