From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 22:02:22 +0200
Subject: [Buildroot] [git commit] package/wireshark: properly guard
	sub-options
Message-ID: <20161020200227.C99EC81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b815d621bb82e5c9f38f05bc431e8f050def632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... otherwise we would end up forcefully enabling the linguist tool even
when wireshark would not be enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index b5a874b..c5b5c3e 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -10,6 +10,8 @@ config BR2_PACKAGE_WIRESHARK
 
 	  https://www.wireshark.org
 
+if BR2_PACKAGE_WIRESHARK
+
 config BR2_PACKAGE_WIRESHARK_QT
 	bool
 	default y
@@ -23,6 +25,8 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	default y if BR2_PACKAGE_LIBGTK3
 	default y if BR2_PACKAGE_WIRESHARK_QT
 
+endif # BR2_PACKAGE_WIRESHARK
+
 comment "wireshark needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
