From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 10:28:06 -0500
Subject: [Buildroot] [PATCH 7/8] setools: check host-python version
In-Reply-To: <20180102152807.31470-1-aduskett@gmail.com>
References: <20180102152807.31470-1-aduskett@gmail.com>
Message-ID: <20180102152807.31470-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check if host-python3 is selected instead of target-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/setools/setools.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 6748c95c23..f4644b091c 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -20,6 +20,12 @@ SETOOLS_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 SETOOLS_DEPENDENCIES += python-enum34
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
+HOST_SETOOLS_NEEDS_HOST_PYTHON += python3
+else
+HOST_SETOOLS_NEEDS_HOST_PYTHON += python
+endif
+
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
-- 
2.14.3
