From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] gdb: do not allow selection of
	non-avr32 versions on AVR32
Message-ID: <20091214232057.F3C6177796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=45e93c575095c4a883e3424c73314ba7835992df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 947cd11..28606ba 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -41,6 +41,7 @@ choice
 		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_7_1
+		depends on !BR2_avr32
 		bool "gdb 6.7.1"
 
 	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-- 
1.6.3.3
