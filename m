From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 21:53:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/cracklib: add python3 support
In-Reply-To: <20200202205306.1785085-1-fontaine.fabrice@gmail.com>
References: <20200202205306.1785085-1-fontaine.fabrice@gmail.com>
Message-ID: <20200202205306.1785085-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python bindings supports python3 since version 2.8.19 and
https://github.com/cracklib/cracklib/commit/219de98766b9f1e4c8c5b174de770158ffda3a93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cracklib/cracklib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 91d510ff34..be1b50f138 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -19,9 +19,9 @@ else
 CRACKLIB_CONF_OPTS += --without-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 CRACKLIB_CONF_OPTS += --with-python
-CRACKLIB_DEPENDENCIES += python
+CRACKLIB_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
 else
 CRACKLIB_CONF_OPTS += --without-python
 endif
-- 
2.24.1
