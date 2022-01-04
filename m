Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7C7C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 12:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A7DB40156;
	Tue,  4 Jan 2022 12:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyEKoHhWUm3A; Tue,  4 Jan 2022 12:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 416AC401CA;
	Tue,  4 Jan 2022 12:39:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D387A1BF288
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 12:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C22B982881
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 12:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixDRxNRy6Van for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 12:39:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90BA3818D0
 for <buildroot@busybox.net>; Tue,  4 Jan 2022 12:39:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i22so75887337wrb.13
 for <buildroot@busybox.net>; Tue, 04 Jan 2022 04:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJ27Vm0FtdWBJvouoH8IqDU2IeyOva6QRGRdEU/hFRk=;
 b=JUJEhWHG81RrDpoU2aKieGwzGcyDmx5+uDZMhMo4yL4ZC70lkF/EbevMLKDwgwKBgK
 21dN6gwv5aAvPN7++uc0lucmPCmcC5qAk+2nZh+6VhInra6fx/F9oAN+WjV1KEBy3StD
 D1/KsowzNOo5Z4haJnXqnoOvPEuPbUXYwbu++xkhMrkPUxjvwK9oIURFiU5ZzBCh0LwE
 WmEKPB9kq1LknWt/Fuz2wUcFPi4VR4aRU5StpbjTjMFdi70GPNeS86aobTYXlv/YWe1U
 Loslp2YbqpaoeceLktNy+lMUiucgYUMLYbV4gFn1O98DTBHQAqkmqykv/yi/j+BQV8/E
 2/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJ27Vm0FtdWBJvouoH8IqDU2IeyOva6QRGRdEU/hFRk=;
 b=6w4c/Scny93y8qu7xqsAre+N/md168Q6rrZDLdkBI6L/KZAKEErA1BAcgFGMvMU70X
 5wh2gcr0js9tP5wQM52havdW4TNWA2AiFDBDlcs0Z/kscq+3dCk5NEcTMm6OlT0X5IZC
 qiG2ws+Tw1wz8H2p0Xv7zrP+glR9q7ejYTDlXr6bAyKDqEWRONxiaq99pjyv7oANdmbL
 YVwE5rap6zHzYWDGphD53LFs5V17JuCovi+/wfcM6sj8HBkjZBe/nQYV0LvqeGI0aTSL
 YSRq0fJEu1G1GKiz3sBnS4gKv+T33YSGOkF+ZTEdeIukVQBHx5J2N2PMXXA1RFQNcBTk
 HYUg==
X-Gm-Message-State: AOAM533umHgAt73BNk3tK3TVccZyUfB259kb/MDjhxA1Hv67A457w8Uj
 xQAKksx5+0vBjkBZj/Rwl80pwNKKmFQ=
X-Google-Smtp-Source: ABdhPJxo8sR+1tiwjbwNuZnW+3+0ASrXVUS0jwcQ4mVnH3wS+ZeuG1AZJ/x+iRJRLFrLxE8X4ljJZg==
X-Received: by 2002:a5d:6c68:: with SMTP id r8mr41445511wrz.281.1641299974415; 
 Tue, 04 Jan 2022 04:39:34 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id g7sm38712303wrx.104.2022.01.04.04.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 04:39:34 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Tue,  4 Jan 2022 13:38:59 +0100
Message-Id: <20220104123901.23929-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/python-pybind: fix upgrade to
 2.6.1
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
Cc: tomi.valkeinen@ideasonboard.com, yann.morin.1998@free.fr,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Fixes
   http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
   http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
   http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
   http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
   http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
   http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
   http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
setup.py now calls 'cmake', as is, internally, with DESTDIR=$(@D)
to provide some setup.py build requirements.

The autobuild failures were actually of different kinds:
  (1) 'cmake' too old causes an early crash as it is unable to parse their CMakeList.txt
   (host machine dependent)
  (2) $(@D)/pybind missing because cmake call was faulty (happened all the time)

The provided patch allows us to fully control the hidden cmake context:
  * which 'cmake' is actually called is important, as most of the time we
  end up using /usr/bin/cmake.
  By adding BR2_CMAKE_DEPENDENCY we make sure (1) never happens and
  (2) is always solved with a complete cmake context control.

We could convert python-pybind to a cmake package but it involves
so much patching and tweaking (mostly for the python install),
that it is now clear that keeping the package as is, is the best option.

I also fixed the previous package declaration / handling:
  * this is a header only lib, so installing to target does not make sense,
  and installing to staging is mandatory

  * most of the time, this package will be used at compile time,
  on host, so having the host-package option is mandatory.
  This package is then used to customize the host/usr/python
  capacity, with C++ macro bindings.
  This patch serie provides an example of use,
  that does exactly that, and works for both python2 and python3
  (refer to following patch)

---
 ...-py-improve-cmake-context-definition.patch | 48 +++++++++++++++++++
 package/python-pybind/python-pybind.mk        | 47 ++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 package/python-pybind/0001-setup-py-improve-cmake-context-definition.patch

diff --git a/package/python-pybind/0001-setup-py-improve-cmake-context-definition.patch b/package/python-pybind/0001-setup-py-improve-cmake-context-definition.patch
new file mode 100644
index 0000000000..0952d44464
--- /dev/null
+++ b/package/python-pybind/0001-setup-py-improve-cmake-context-definition.patch
@@ -0,0 +1,48 @@
+From aeee170bc90d89973268f286c8bfa12afd8f330c Mon Sep 17 00:00:00 2001
+From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
+Date: Thu, 9 Dec 2021 20:30:08 +0100
+Subject: [PATCH] setup.py: improve cmake context definition
+
+Use two env. variables to define which cmake
+is internally called and pass a toolchain file
+for complex cross-compilation contexts.
+
+Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
+---
+ setup.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 3a03279..2dff721 100644
+--- a/setup.py
++++ b/setup.py
+@@ -23,6 +23,8 @@ VERSION_REGEX = re.compile(
+ # files, and the sys.prefix files (CMake and headers).
+
+ global_sdist = os.environ.get("PYBIND11_GLOBAL_SDIST", False)
++global_cmake = os.environ.get("PYBIND11_CMAKE", "unknown")
++global_cmake_toolchain_file = os.environ.get("PYBIND11_CMAKE_TOOLCHAIN_FILE", "unknown")
+
+ setup_py = "tools/setup_global.py.in" if global_sdist else "tools/setup_main.py.in"
+ extra_cmd = 'cmdclass["sdist"] = SDist\n'
+@@ -101,14 +103,15 @@ def remove_output(*sources):
+ with remove_output("pybind11/include", "pybind11/share"):
+     # Generate the files if they are not present.
+     with TemporaryDirectory() as tmpdir:
+-        cmd = ["cmake", "-S", ".", "-B", tmpdir] + [
++        cmd = [global_cmake, "-S", ".", "-B", tmpdir] + [
+             "-DCMAKE_INSTALL_PREFIX=pybind11",
++            "-DCMAKE_TOOLCHAIN_FILE={:s}".format(global_cmake_toolchain_file),
+             "-DBUILD_TESTING=OFF",
+             "-DPYBIND11_NOPYTHON=ON",
+         ]
+         cmake_opts = dict(cwd=DIR, stdout=sys.stdout, stderr=sys.stderr)
+         subprocess.check_call(cmd, **cmake_opts)
+-        subprocess.check_call(["cmake", "--install", tmpdir], **cmake_opts)
++        subprocess.check_call([global_cmake, "--install", tmpdir], **cmake_opts)
+
+     txt = get_and_replace(setup_py, version=version, extra_cmd=extra_cmd)
+     code = compile(txt, setup_py, "exec")
+--
+1.8.3.1
+
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index a6a1bdb976..442ed3328f 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -10,4 +10,51 @@ PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
 PYTHON_PYBIND_SETUP_TYPE = setuptools
 
+# Only installs header files
+PYTHON_PYBIND_INSTALL_TARGET = NO
+PYTHON_PYBIND_INSTALL_STAGING = YES
+
+# their cmakelist.txt file needs a recent cmake
+PYTHON_PYBIND_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
+HOST_PYTHON_PYBIND_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
+
+# every single setup.py interaction calls 'cmake' (as is) intrinsicly.
+# we deliver a patch to customize setup.py to define the cmake context
+# using the following variables
+PYTHON_PYBIND_MAKE_ENV = $(MAKE_ENV)
+PYTHON_PYBIND_SETUPTOOLS_ENV = $(PKG_PYTHON_SETUPTOOLS_ENV)
+PYTHON_PYBIND_SETUPTOOLS_ENV += PYBIND11_CMAKE=$(BR2_CMAKE)
+PYTHON_PYBIND_SETUPTOOLS_ENV += PYBIND11_CMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake
+
+HOST_PYTHON_PYBIND_MAKE_ENV = $(MAKE_ENV)
+HOST_PYTHON_PYBIND_SETUPTOOLS_ENV = $(PKG_PYTHON_SETUPTOOLS_ENV)
+HOST_PYTHON_PYBIND_SETUPTOOLS_ENV += PYBIND11_CMAKE=$(BR2_CMAKE)
+HOST_PYTHON_PYBIND_SETUPTOOLS_ENV += PYBIND11_CMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake
+
+define PYTHON_PYBIND_BUILD_CMDS
+	cd $(@D); \
+		$(PYTHON_PYBIND_SETUPTOOLS_ENV) $(HOST_DIR)/usr/bin/python setup.py build
+endef
+
+define HOST_PYTHON_PYBIND_BUILD_CMDS
+	cd $(@D); \
+		$(PYTHON_PYBIND_SETUPTOOLS_ENV) $(HOST_DIR)/usr/bin/python setup.py build
+endef
+
+# define installation destinations properly
+define PYTHON_PYBIND_INSTALL_STAGING_CMDS
+	cd $(@D); \
+		$(PYTHON_PYBIND_SETUPTOOLS_ENV) \
+			PREFIX=$(STAGING_DIR)/usr \
+				$(HOST_DIR)/bin/python setup.py install
+endef
+
+define HOST_PYTHON_PYBIND_INSTALL_CMDS
+	cd $(@D); \
+		$(PYTHON_PYBIND_SETUPTOOLS_ENV) \
+			PREFIX=$(HOST_DIR)/usr \
+				$(HOST_DIR)/bin/python setup.py install
+endef
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
