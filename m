From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:05:50 +0100
Subject: [Buildroot] [git commit] aiccu: disable for uClibc 0.9.31/0.9.32
Message-ID: <20131226220558.A8C8D9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87492d244a1dbf6114bb464e8d8dbedcf08fb399
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aiccu uses the dn_skipname() function, which was only introduced in
uClibc 0.9.33. Therefore, we disable this package when uClibc 0.9.31
and 0.9.32. Most likely, only AVR32 users will be affected by this, so
we don't add a specific kconfig comment for that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aiccu/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index f56ad75..17e6449 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -4,6 +4,9 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# Uses dn_skipname(), only available since 0.9.33
+	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
+		!BR2_UCLIBC_VERSION_0_9_32
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
