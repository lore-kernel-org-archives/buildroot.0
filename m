From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Oct 2020 23:04:33 +0200
Subject: [Buildroot] [git commit] docs/manual: add section about
 br2-external init
Message-ID: <20201014210410.493FA815EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03dfc6acf693f63c1227e4b35a0cca69ac53d3f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - move before skeletons
  - select the custom 'mine' skeleton, not the sysv one
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/customize-outside-br.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 2c3bc5243d..348f2b089c 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -202,7 +202,9 @@ a set of files that define those alternatives:
   will then be listed in the toolchain selection;
 * +provides/jpeg.in+ defines the alternative libjpeg implementations;
 * +provides/openssl.in+ defines the alternative openssl implementations;
-* +provides/skeleton.in+ defines the alternative skeleton implementations.
+* +provides/skeleton.in+ defines the alternative skeleton implementations;
+* +provides/init.in+ defines the alternative init system implementations, this
+  can be used to select a default skeleton for your init.
 
 ===== Free-form content
 
@@ -302,6 +304,13 @@ illustration, of course):
   |     |$(eval $(autotools-package))
   |     `----
   |
+  |- provides/init.in
+  |     |config BR2_INIT_MINE
+  |     |    bool "my custom init"
+  |     |    select BR2_PACKAGE_MY_INIT
+  |     |    select BR2_PACKAGE_SKELETON_INIT_MINE if BR2_ROOTFS_SKELETON_DEFAULT
+  |     `----
+  |
   |- provides/skeleton.in
   |     |config BR2_ROOTFS_SKELETON_MINE
   |     |    bool "my custom skeleton"
