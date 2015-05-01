From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:26:51 +0200
Subject: [Buildroot] [git commit] boot/gummiboot: switch to http for git
	clone
Message-ID: <20150501083245.C215281DEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5977d77aea6638cf26156551a4a85747e883d6ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The git:// protocol may not go through conservative corporate firewalls.
Use http, that goes out through about anything.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/gummiboot/gummiboot.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 72f9c53..02ad28b 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GUMMIBOOT_SITE = git://anongit.freedesktop.org/gummiboot
+GUMMIBOOT_SITE = http://cgit.freedesktop.org/gummiboot
+GUMMIBOOT_SITE_METHOD = git
 GUMMIBOOT_VERSION = 43
 GUMMIBOOT_LICENSE = LGPLv2.1+
 GUMMIBOOT_LICENSE_FILES = LICENSE
