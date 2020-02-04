From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 22:41:23 +0100
Subject: [Buildroot] [git commit] package/xen: use host-python3 to build
Message-ID: <20200204213539.516BA8B815@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5dd9f6beb94abee8c932edb180dcbe465c4e79c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noted in https://wiki.xenproject.org/wiki/Xen_Project_4.13_Release_Notes

- Xen 4.13 is now fully Py3 compatible

So swith to that now that python 2.x is EOL.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 951af963e0..fa49f5996b 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,7 +8,7 @@ XEN_VERSION = 4.13.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-XEN_DEPENDENCIES = host-acpica host-python
+XEN_DEPENDENCIES = host-acpica host-python3
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
@@ -21,7 +21,7 @@ XEN_CONF_OPTS = \
 	--disable-ocamltools \
 	--with-initddir=/etc/init.d
 
-XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python2
+XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python3
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
 	CROSS_COMPILE=$(TARGET_CROSS) \
