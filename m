Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEACFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7047A60BC6;
	Mon, 24 Jan 2022 09:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TeIF1DIwE4VX; Mon, 24 Jan 2022 09:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E9260BA4;
	Mon, 24 Jan 2022 09:44:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC551BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B89460BA4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXsnnNRY-xx4 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A9CA60A78
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:44:12 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id r15so13314467ilj.7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 01:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnNN9ezl9Wm3W+QND8dEc4IhqRKRiQ/JLr5whe0ohfg=;
 b=GB4XZiM5tdaGTJKdJhCjHBAl2Qi6NBG5cUQii5TEsPrUreWS8+JmcrTfJMxubVxlJ7
 aDCsouWra8P7wsEdFONdbH2yobydoQdfdZDVcIYNbt+Egmi/C6lUkM0LHWi0Z3bPPuRi
 rrm2Or8yQeCuHx2takTE7tuI3hnKtLNJ9Mwfdeiawjg+aGvxdO409brZD/gPG0xhoVoY
 EgLFkv6wEDx2P9ye4e4ae/9zYoFCvsCTuLztj1KHL65BEHB74bk1VTF8u9kuktTN4pe/
 vGG9T9ZvOzOe0/LCc1nqrEBMyAuFvECSz/iKPX25Ntwc/Uf4WKdz8yX8VQea9/bFBOqu
 LMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnNN9ezl9Wm3W+QND8dEc4IhqRKRiQ/JLr5whe0ohfg=;
 b=JMBDbrXpaEhsn+sA4xNyLDHQ+UBBZyPIWtxvGqGl8pnNEB8ka6JKVcV3X7PTlfOMEU
 AfF5O6IDtJjxXQVQbR9tji0KCwLeSKrLCd1ERlwqEt2UCeoJP1xI+O0QEdlwUdJKjKs3
 CPMahDHZ4weU8xGwnBwSDUg8SO1Tf/tiHbTdQLGlTacpGK/5bTLzSDPXDnTsTkQBEVAy
 IY6PnhWbUmO7ES6sy2ZVFiwMlefLisklmmlOg3AKJz52pOqW1atkJQVG4pn6O/pb1Ddw
 bvF+bPNUrGa/dIfenfr1uCiGZoFxWQIitgdjQLQiZ7Kqap6EVVrifoR6wjF5nHG272E3
 N/lA==
X-Gm-Message-State: AOAM530+98VnLH3SSVnDWEkaSzDfIM6IJ1WA3bx0dVa02clFUKHaducQ
 RG6YEDweaYxu7xikso6U7mPwua+dSOY=
X-Google-Smtp-Source: ABdhPJw7gaNk4dqfs8nhY/EhNRNJAkjdM5EAr+TtVzhCqDavqQjRN5vzsfgLJQ9Bp3ZC23/zKHy0Zg==
X-Received: by 2002:a05:6e02:180e:: with SMTP id
 a14mr5948291ilv.307.1643017451045; 
 Mon, 24 Jan 2022 01:44:11 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id 8sm7424714ilq.14.2022.01.24.01.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 01:44:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 02:44:08 -0700
Message-Id: <20220124094408.421939-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 21.11.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...r-packages-and-xbr-templates-package.patch | 54 -----------------
 ...y-default-and-don-t-publish-universa.patch | 60 -------------------
 package/python-autobahn/python-autobahn.hash  |  4 +-
 package/python-autobahn/python-autobahn.mk    |  5 +-
 4 files changed, 5 insertions(+), 118 deletions(-)
 delete mode 100644 package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
 delete mode 100644 package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch

diff --git a/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch b/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
deleted file mode 100644
index f239345dc7..0000000000
--- a/package/python-autobahn/0001-Fix-duplicate-xbr-packages-and-xbr-templates-package.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From b13b7e38b38e2c79c0a13be32e05f0451483cd01 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 12 Jun 2021 15:32:37 -0600
-Subject: [PATCH] Fix duplicate xbr packages and xbr templates package_data.
- (#1492)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-a370f9e7154e59b313cb675bfcaf8cad6011bd52]
----
- MANIFEST.in |  1 -
- setup.py    | 10 ++++++++--
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/MANIFEST.in b/MANIFEST.in
-index f4cb6da1..1dd32f0e 100644
---- a/MANIFEST.in
-+++ b/MANIFEST.in
-@@ -1,4 +1,3 @@
- include LICENSE
- include autobahn/nvx/_utf8validator.c
- recursive-include autobahn/wamp/gen/schema *
--recursive-include autobahn/xbr/templates *
-diff --git a/setup.py b/setup.py
-index cf4e29ba..f27006da 100644
---- a/setup.py
-+++ b/setup.py
-@@ -166,6 +166,12 @@ packages = [
-     'twisted.plugins',
- ]
- 
-+xbr_packages = [
-+    'autobahn.xbr',
-+    'autobahn.asyncio.xbr',
-+    'autobahn.twisted.xbr',
-+]
-+
- package_data = {'autobahn.asyncio': ['./test/*']}
- 
- entry_points = {
-@@ -179,8 +185,8 @@ if 'AUTOBAHN_STRIP_XBR' in os.environ:
-     shutil.rmtree('autobahn.egg-info', ignore_errors=True)
- else:
-     extras_require_all += extras_require_xbr
--    packages += ['autobahn.xbr', 'autobahn.asyncio.xbr', 'autobahn.twisted.xbr']
--    package_data['xbr'] = ['./xbr/contracts/*.json']
-+    packages += xbr_packages
-+    package_data['xbr'] = ['./xbr/templates/*.py.jinja2']
-     entry_points['console_scripts'] += ["xbrnetwork = autobahn.xbr._cli:_main"]
- 
- # development dependencies
--- 
-2.25.1
-
diff --git a/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch b/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch
deleted file mode 100644
index c2c2cf5777..0000000000
--- a/package/python-autobahn/0002-Build-with-nvx-by-default-and-don-t-publish-universa.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 1e3162bab59cbc2f7cf8b9ef6cadf55ee273c1d8 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 22 Jul 2021 06:56:51 -0600
-Subject: [PATCH] Build with nvx by default and don't publish universal wheel.
- (#1493)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-a35f22eeaafca7568f1deb35c4a1b82ae78f77d4]
----
- Makefile                       | 8 ++++----
- autobahn/nvx/_utf8validator.py | 7 ++++++-
- setup.py                       | 7 +------
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/autobahn/nvx/_utf8validator.py b/autobahn/nvx/_utf8validator.py
-index e72fc872..34393356 100644
---- a/autobahn/nvx/_utf8validator.py
-+++ b/autobahn/nvx/_utf8validator.py
-@@ -44,13 +44,18 @@ ffi.cdef("""
-     int nvx_utf8vld_get_impl(void* utf8vld);
- """)
- 
-+optional = True
-+if 'AUTOBAHN_USE_NVX' in os.environ and os.environ['AUTOBAHN_USE_NVX'] in ['1', 'true']:
-+    optional = False
-+
- with open(os.path.join(os.path.dirname(__file__), '_utf8validator.c')) as fd:
-     c_source = fd.read()
-     ffi.set_source(
-         "_nvx_utf8validator",
-         c_source,
-         libraries=[],
--        extra_compile_args=['-std=c99', '-Wall', '-Wno-strict-prototypes', '-O3', '-march=native']
-+        extra_compile_args=['-std=c99', '-Wall', '-Wno-strict-prototypes', '-O3', '-march=native'],
-+        optional=optional
-     )
- 
- 
-diff --git a/setup.py b/setup.py
-index f27006da..4889a39e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -110,12 +110,7 @@ extras_require_nvx = [
- 
- # cffi based extension modules to build, currently only NVX
- cffi_modules = []
--if 'AUTOBAHN_USE_NVX' in os.environ:
--    # FIXME: building this extension will make the wheel
--    # produced no longer universal (as in "autobahn-18.4.1-py2.py3-none-any.whl").
--    # on the other hand, I don't know how to selectively include this
--    # based on the install flavor the user has chosen (eg pip install autobahn[nvx]
--    # should make the following be included)
-+if 'AUTOBAHN_USE_NVX' not in os.environ or os.environ['AUTOBAHN_USE_NVX'] not in ['0', 'false']:
-     cffi_modules.append('autobahn/nvx/_utf8validator.py:ffi')
- 
- extras_require_xbr = [
--- 
-2.25.1
-
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 7de1e7e673..0bbb9112d0 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  dcba839ee61be33d05042a09c008c6bc  autobahn-21.3.1.tar.gz
-sha256  e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03  autobahn-21.3.1.tar.gz
+md5  1ccd46d938d8b9fed435e9781e54e887  autobahn-21.11.1.tar.gz
+sha256  bd6f46315419ca0a5be4109f737410208ad5f19718f67ca6a4a674cc66ca9b18  autobahn-21.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 4ec47f54ce..481d9373ad 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 21.3.1
+PYTHON_AUTOBAHN_VERSION = 21.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/4c/9e/f5bdfb55d1eab67c4b6d24d1397f95feec792071ff1b2f5a893d6d5247f3
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/f1/d3/23fdf1ab0104b1b65d2f7884e923f0526750a59f96334d752afc79cf44ed
+PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
