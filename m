From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Dec 2012 19:11:30 +0100
Subject: [Buildroot] [PATCH 2/2] package/keyutils: disable on avr32
In-Reply-To: <cover.1356459033.git.yann.morin.1998@free.fr>
References: <cover.1356459033.git.yann.morin.1998@free.fr>
Message-ID: <8d01634829b527333c15467ad91cd0cbeb4c91bb.1356459033.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

keyutils does not build on avr32 (probably
because the toolchain is way too old).

Fixes:
    http://autobuild.buildroot.net/results/aa86f6a68f5d0ea4914ab259ed270615bc9d6a99/

Merry X-Mas!

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/keyutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index 9b5a24b..f77eb52 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KEYUTILS
 	bool "keyutils"
+	depends on !BR2_avr32
 	help
 	  These tools are used to control the key management system
 	  built into the Linux kernel.
-- 
1.7.2.5
