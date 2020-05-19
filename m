From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 May 2020 21:01:13 +0200
Subject: [Buildroot] [git commit] package/cracklib: add python3 support
Message-ID: <20200519184522.95B7091AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f584595424137399dd06f73c6f04c759e04b879e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python bindings supports python3 since version 2.8.19 and
https://github.com/cracklib/cracklib/commit/219de98766b9f1e4c8c5b174de770158ffda3a93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
