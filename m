From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 10:06:44 +0200
Subject: [Buildroot] [git commit] package/apparmor: add a dependency on
 net-tools if utils is selected
Message-ID: <20200508075218.E953D90F1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb02ef549f91370335acaf41d97874ca013b6d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aa-unconfied requires the full version of netstat provided by the net-tools
package. Without the full version, running aa-unconfined will result in the
error:
netstat: invalid option -- 'p'

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - net-ttols is a runtime depednency
  - select BB_SHOW_OTHERS
  - reorder depends
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apparmor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
index b0d2e44ff7..1cc9daa7b5 100644
--- a/package/apparmor/Config.in
+++ b/package/apparmor/Config.in
@@ -32,6 +32,8 @@ comment "utils need python3"
 config BR2_PACKAGE_APPARMOR_UTILS
 	bool "utils"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # net-tools
+	select BR2_PACKAGE_NET_TOOLS # runtime (aa-unconfined)
 	select BR2_PACKAGE_PYTHON3_READLINE
 	help
 	  A set of utilities (written in python):
