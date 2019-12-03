From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 13:17:45 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/gob2: add license
Message-ID: <20191203120946.C2F3C83C4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66b2679de63e3905475329d4d39afb60f0292113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

gob2 itself is GPL-2.0+, but it is a code generator. The code generated
by gob2 id not covered by gob2's license, and this is made explicit in
an accompanying license file.

So we include both license files.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - add COPYING.generated-code
  - expand commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9d1b48a1e56b54fce6d0b2b451d5f4dd829daf1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gob2/gob2.hash | 2 ++
 package/gob2/gob2.mk   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/gob2/gob2.hash b/package/gob2/gob2.hash
index 3678bdd5c9..7edf518f34 100644
--- a/package/gob2/gob2.hash
+++ b/package/gob2/gob2.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256 f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026  gob2-2.0.20.tar.xz
+sha256 b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
+sha256 7222386392eecf784e2f0c406f412f238cb6d25865a8447ae0947b32bb569889  COPYING.generated-code
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index fe60673821..d0cce8fb76 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,6 +7,8 @@
 GOB2_VERSION = 2.0.20
 GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.xz
 GOB2_SITE = http://ftp.5z.com/pub/gob
+GOB2_LICENSE = GPL-2.0+
+GOB2_LICENSE_FILES = COPYING COPYING.generated-code
 HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 
 $(eval $(host-autotools-package))
