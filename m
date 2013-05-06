From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 May 2013 00:47:02 +0200
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
Message-ID: <1367880422-12739-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For the following reasons:
  - it used to be broken without anyone noticing for a long time,
  - it is still not fully integrated within the Buildroot set of options,
  - it has not gained much traction (not even I use it),
  - I've always argued that sustained development should use an external
    toolchain, and not rely on building one with Buildroot,
  - I did not submit any of the enhancements requested during the last
    developpers' day in Brussels,
  - I have neither the incentive nor the time to maintain and enhance it,

it is time to deprecate the crosstool-NG backend for the 2013.05 release.

Then, it will be entirely removed early in the 2013.08 cycle, to let some
time for those that rely on it to voice their opinions. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index e6a3b25..665618c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -22,6 +22,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
+	depends on BR2_DEPRECATED
 	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa && !BR2_arc
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
-- 
1.8.1.2
