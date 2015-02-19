From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:04:26 +0100
Subject: [Buildroot] [git commit branch/next] glibc: nios2: Prevent
	selecting unsupported versions
Message-ID: <20150219212508.25C85801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccd5519d1a13f6f2fe5d6accf31dbfa2802e1a0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Versions previous to glibc v2.21 do not support the Nios-II architecture
so disable them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 3038b27..8001491 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -33,6 +33,7 @@ choice
 	default BR2_GLIBC_VERSION_2_20
 
 config BR2_GLIBC_VERSION_2_20
+	depends on !BR2_nios2
 	bool "2.20"
 
 config BR2_GLIBC_VERSION_2_21
