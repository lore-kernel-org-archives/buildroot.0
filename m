From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 May 2020 21:08:11 +0200
Subject: [Buildroot] [git commit] Revert "package/cracklib: add python3
 support"
Message-ID: <20200519185404.6221291AAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39ae8290aadf8c3b29388a9ebe0b32a7f6dd8e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit f584595424137399dd06f73c6f04c759e04b879e.
It in fact depends on a previous patch to python that was not applied
[0], as upstream believes it is dangerous [1], and is still debating the
proper solution [2].

[0] https://patchwork.ozlabs.org/project/buildroot/patch/20200202205306.1785085-1-fontaine.fabrice at gmail.com/
[1] https://bugs.python.org/issue39026#msg369309
[2] https://bugs.python.org/issue39026

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cracklib/cracklib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index be1b50f138..91d510ff34 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -19,9 +19,9 @@ else
 CRACKLIB_CONF_OPTS += --without-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 CRACKLIB_CONF_OPTS += --with-python
-CRACKLIB_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+CRACKLIB_DEPENDENCIES += python
 else
 CRACKLIB_CONF_OPTS += --without-python
 endif
