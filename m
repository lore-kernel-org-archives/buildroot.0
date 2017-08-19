From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Aug 2017 08:46:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/xen: fix build with gcc7
Message-ID: <20170819064645.8807-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f95/f9553c1669bd05acee3ccea76e36c2474e534d8c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xen/0003-gcc7.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/xen/0003-gcc7.patch

diff --git a/package/xen/0003-gcc7.patch b/package/xen/0003-gcc7.patch
new file mode 100644
index 000000000..5919ef023
--- /dev/null
+++ b/package/xen/0003-gcc7.patch
@@ -0,0 +1,20 @@
+Fix arm build with gcc7
+
+Downloaded from upstream patchworks:
+https://patchwork.kernel.org/patch/9754799/
+https://www.mail-archive.com/xen-devel at lists.xen.org/msg109313.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
+index e7d4bd0..e669fb0 100644
+--- a/tools/libxc/xc_dom_arm.c
++++ b/tools/libxc/xc_dom_arm.c
+@@ -223,6 +223,8 @@ static int set_mode(xc_interface *xch, domid_tdomid, char *guest_type)
+ 
+     domctl.domain = domid;
+     domctl.cmd    = XEN_DOMCTL_set_address_size;
++    domctl.u.address_size.size = 0;
++
+     for ( i = 0; i < ARRAY_SIZE(types); i++ )
+         if ( !strcmp(types[i].guest, guest_type) )
-- 
2.11.0
