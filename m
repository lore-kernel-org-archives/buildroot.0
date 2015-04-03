From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:31:39 +0200
Subject: [Buildroot] [git commit] samba: deprecate package due to EOL
Message-ID: <20150403123150.3F03181910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cf5d91167cda1bbc6ffac8330992cefc07fb489
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Samba 3.6.x is now EOL, people should move to samba4.

See: https://www.samba.org/samba/history/samba-4.2.0.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 9d04851..7ff8428 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_nios2 # binary too large, relocations don't fit
@@ -15,6 +16,7 @@ config BR2_PACKAGE_SAMBA
 		so choose only the components you need.
 
 comment "samba needs a toolchain w/ threads"
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
