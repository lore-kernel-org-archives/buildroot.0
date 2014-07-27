From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:32:50 +0200
Subject: [Buildroot] [git commit] hostapd: EAP support needs shared library
	support
Message-ID: <20140727083255.7977A9D2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d1f55022798fb619241c7796eef8fcad4a84128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/dcb/dcbdc25cd5b46917c8f740d492db7512021462fa/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index eb530b3..8783e66 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -15,9 +15,13 @@ if BR2_PACKAGE_HOSTAPD
 
 config BR2_PACKAGE_HOSTAPD_EAP
 	bool "Enable EAP"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Enable support for EAP and RADIUS.
 
+comment "hostapd EAP needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_HOSTAPD_WPS
 	bool "Enable WPS"
 	help
