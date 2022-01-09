Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB64C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 311FE40078;
	Sun,  9 Jan 2022 12:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYqJuCvwy339; Sun,  9 Jan 2022 12:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27B1440081;
	Sun,  9 Jan 2022 12:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2EC1BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C7EB4040B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6HetIwiY7Dg for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:44:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B2A40348
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:44:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so4060647wme.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lDgcgkkI1B4jjFo8LX5rJ9ge1Pz1mZ5BGjzbTzoiOOM=;
 b=GxddHerRz4+4ub2/uu0NscJjtP+07O1K9lFW7q8Yb16KT1RAU4rwdeyj2gNvlsEDNm
 pTVikFRVKNId5NK+MXE5+c5trwu+mB3buXs2gGNhg0G12KPri4OH5gb9d2aYfzRichLA
 4TR0ix8ZhbTyorEy0Rl/rewAsczel0kE6MTUxqiHeYvBdtnfOGxFUgALNhbL4QHkYeLg
 2FETklvXkCMuyrcjDhoQzazGa/9Fz3VauWGA7zgcHcKouZ5P+VzB0RGsTq3KM5rxiFei
 TU1U28RbBc8kYxOnyWOy/jZv1W9oujzN8oNmRDsLFRuMk8Zz37F4dzlSK9GG0m+sWkCE
 LsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lDgcgkkI1B4jjFo8LX5rJ9ge1Pz1mZ5BGjzbTzoiOOM=;
 b=XF3atLGPucSS4dPzPHXFbIvqLoksIaMyy3SqTc7I+N7vAd4FJwpviJokUrkPPXhXeR
 5+/R6ldPy9G1nZZSShge5spTVq63IBCpE4kxsSDa/FXXgCgxdb8lcJe/sNUHnTxmds09
 QnfhvCAKJ6RNQvPTSSPsQfKzlQlCsk0Ld/xsakPoqwVoB65vEa/85JpkTTPPdGut7iJv
 zbqj4oybhF+2gqy8oO+MkrXhSvVrOcYBcqwwcn5RfOS1WQ2wqEeg8sUQnwfprdH5PFOI
 BsDom9d8TV6WTHqWx+RG/LNrL0qmDHnRqmyW1WZJES16gosahEJBgHGHojJHFvv5yu9H
 Ww6Q==
X-Gm-Message-State: AOAM531MxTnjaroknuMWkumeUCWu1lINcWMJaDgmeIGxZcdWf/+RM306
 PfOt3y9MtO2410f60O/Y3U9WrMHQM5Q=
X-Google-Smtp-Source: ABdhPJxfCXoZUSfGO+E3qvvyAigfVNIkDlmbYkXdqXPQxSNQhR362DcrC9QLLeIVpdkxUqkTDHjt6Q==
X-Received: by 2002:a05:600c:2f97:: with SMTP id
 t23mr17263400wmn.85.1641732297437; 
 Sun, 09 Jan 2022 04:44:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id o5sm3880290wmc.39.2022.01.09.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 04:44:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 13:43:35 +0100
Message-Id: <20220109124335.302679-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: needs python3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-setuptools-scm dropped python 2 support since
https://github.com/pypa/setuptools_scm/commit/f0be71fbcf150bfc68e4169226399d6ae4da8f1b
resulting in the following build failure since bump to version 6.3.2 in
commit 12e3527fd97df9ae1b60b892c61d10ce291b7a00:

/buildroot/autobuild/instance-2/output-1/host/lib" INTLTOOL_PERL=/usr/bin/perl  /home/buildroot/autobuild/instance-2/output-1/host/bin/python setup.py build  )
  File "setup.py", line 22
    f"{type(self).__name__} is forbidden, "
                                          ^

Fixes:
 - http://autobuild.buildroot.org/results/2f6125993de364b4a44d259f16806e6dfd792402

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                                  |  7 +++++++
 package/Config.in                                 |  1 -
 .../Config.in                                     |  7 -------
 .../python-backports-functools-lru-cache.hash     |  5 -----
 .../python-backports-functools-lru-cache.mk       | 15 ---------------
 package/python-crontab/Config.in                  |  1 +
 package/python-dateutil/Config.in                 |  1 +
 package/python-jaraco-classes/Config.in           |  1 +
 package/python-jsonmodels/Config.in               |  1 +
 package/python-py/Config.in                       |  1 +
 .../python-setuptools-scm-git-archive.mk          |  1 +
 .../python-setuptools-scm.mk                      |  1 +
 package/python-xlib/Config.in                     |  1 +
 13 files changed, 15 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-backports-functools-lru-cache/Config.in
 delete mode 100644 package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
 delete mode 100644 package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 75873ff74b..d36eac3302 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
+	bool "python-backports-functools-lru-cache package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as python-setuptools-scm
+	  dropped support of python 2 since version 6.0.0.
+
 config BR2_PACKAGE_CIVETWEB_WITH_LUA
 	bool "civetweb lua support option removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 8a7dd446b7..2f6b03841f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -938,7 +938,6 @@ menu "External python modules"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
 	source "package/python-backports-abc/Config.in"
-	source "package/python-backports-functools-lru-cache/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
diff --git a/package/python-backports-functools-lru-cache/Config.in b/package/python-backports-functools-lru-cache/Config.in
deleted file mode 100644
index a5b7771e4d..0000000000
--- a/package/python-backports-functools-lru-cache/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
-	bool "python-backports-functools-lru-cache"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Backport of functools.lru_cache from Python 3.3
-
-	  https://github.com/jaraco/backports.functools_lru_cache
diff --git a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
deleted file mode 100644
index 3db4aec1fb..0000000000
--- a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/backports.functools_lru_cache/json
-md5	20f53f54cd3f04b3346ce75a54959754  backports.functools_lru_cache-1.5.tar.gz
-sha256	9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a  backports.functools_lru_cache-1.5.tar.gz
-# Localy computed sha256 checksumms
-sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk
deleted file mode 100644
index 334d6d8c49..0000000000
--- a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-backports-functools-lru-cache
-#
-################################################################################
-
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_VERSION = 1.5
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SOURCE = backports.functools_lru_cache-$(PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_VERSION).tar.gz
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SITE = https://files.pythonhosted.org/packages/57/d4/156eb5fbb08d2e85ab0a632e2bebdad355798dece07d4752f66a8d02d1ea
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SETUP_TYPE = setuptools
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_LICENSE = MIT
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
diff --git a/package/python-crontab/Config.in b/package/python-crontab/Config.in
index 102dbbdb6b..7514a3866b 100644
--- a/package/python-crontab/Config.in
+++ b/package/python-crontab/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CRONTAB
 	bool "python-crontab"
+	depends on BR2_PACKAGE_PYTHON3 # python-dateutil -> host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	help
 	  Crontab module for reading and writing crontab files and
diff --git a/package/python-dateutil/Config.in b/package/python-dateutil/Config.in
index 1a36a150b1..bbf61f6813 100644
--- a/package/python-dateutil/Config.in
+++ b/package/python-dateutil/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DATEUTIL
 	bool "python-dateutil"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_SIX
 	help
 	  Extensions to the standard Python datetime module.
diff --git a/package/python-jaraco-classes/Config.in b/package/python-jaraco-classes/Config.in
index 05c11237ab..271e085c6f 100644
--- a/package/python-jaraco-classes/Config.in
+++ b/package/python-jaraco-classes/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JARACO_CLASSES
 	bool "python-jaraco-classes"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Utility functions for Python class constructs.
diff --git a/package/python-jsonmodels/Config.in b/package/python-jsonmodels/Config.in
index f66982874a..84a269f171 100644
--- a/package/python-jsonmodels/Config.in
+++ b/package/python-jsonmodels/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JSONMODELS
 	bool "python-jsonmodels"
+	depends on BR2_PACKAGE_PYTHON3 # python-dateutil -> host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-py/Config.in b/package/python-py/Config.in
index 354372f5b4..0e3c3390a0 100644
--- a/package/python-py/Config.in
+++ b/package/python-py/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PY
 	bool "python-py"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	help
 	  library with cross-python path, ini-parsing, io, code, log
 	  facilities.
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 032e2d3fc9..48ca9c89ae 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -11,5 +11,6 @@ PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
 HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index f7f4e3ef27..b2990a56cb 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -11,5 +11,6 @@ PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
+HOST_PYTHON_SETUPTOOLS_SCM_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-xlib/Config.in b/package/python-xlib/Config.in
index 081af6a2fc..20e585db9a 100644
--- a/package/python-xlib/Config.in
+++ b/package/python-xlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_XLIB
 	bool "python-xlib"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  XLib in pure Python (Py2/Py3 compatible)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
