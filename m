From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 22:08:31 +0200
Subject: [Buildroot] [git commit] kmscube: Bump to the most recent version
Message-ID: <20200401200035.3D1508A536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f77b149a36b5dbaf51d7b8ea35752b6924d1b62d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest kmscube version.

Since kmscube has been converted to meson, adjust the .mk file
accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmscube/kmscube.hash | 2 +-
 package/kmscube/kmscube.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index e306d0055e..6a4140c541 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 254d34209740731a557469030c960bbfd2299485a2ad0cbed2f7040b56a292a7  kmscube-6cbd03ab94066dddbba7bedfde87c7c4319c18d5.tar.gz
+sha256  ec135069d8bee7f4fe38cb9dc96fbbd56e0057290fa25eff8b5b314ee473c502  kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 73d290c88b..dc8c691864 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-KMSCUBE_VERSION = 6cbd03ab94066dddbba7bedfde87c7c4319c18d5
+KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
 KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
-KMSCUBE_AUTORECONF = YES
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
