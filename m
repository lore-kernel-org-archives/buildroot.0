From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:12:09 +0200
Subject: [Buildroot] [git commit] smstools3: needs mmu
Message-ID: <20140403181311.97B739C518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34d5f90b8bcf4bc1d87e82e3fbd958552e79a8cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9fe/9fe7a34501a39d4a1eaaedb75ab58e7cbdbe15c5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smstools3/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/smstools3/Config.in b/package/smstools3/Config.in
index 72d0af6..1086869 100644
--- a/package/smstools3/Config.in
+++ b/package/smstools3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SMSTOOLS3
 	bool "smstools3"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
