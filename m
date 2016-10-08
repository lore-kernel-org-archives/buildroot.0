From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Sat,  8 Oct 2016 16:34:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-configshell-fb: update URL
	to the open-iscsi organization
In-Reply-To: <20161008143452.31637-1-cvubrugier@fastmail.fm>
References: <20161008143452.31637-1-cvubrugier@fastmail.fm>
Message-ID: <20161008143452.31637-2-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a comment to indicate that python-rtslib-fb and targetcli-fb
should be bumped every time python-configshell-fb is bumped because
upstream usually upgrades all of these packages at the same time.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python-configshell-fb/Config.in                | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index a680ce0..90a295f 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	  configshell-fb is a Python library that provides a framework
 	  for building simple but nice CLI-based applications.
 
-	  https://github.com/agrover/configshell-fb
+	  https://github.com/open-iscsi/configshell-fb
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index d0671d5..a2e9cae 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
+# When upgrading the version, be sure to also upgrade python-rtslib-fb
+# and targetcli-fb at the same time.
 PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb18
-PYTHON_CONFIGSHELL_FB_SITE = $(call github,agrover,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
+PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
 PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
-- 
2.9.3
