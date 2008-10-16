From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:35 -0600
Subject: [Buildroot] [PATCH 4/9] Add Xilinx UARTLITE and MPC5200 PSC device
	files (serial	ports)
In-Reply-To: <20081016203220.15826.26173.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
Message-ID: <20081016203235.15826.70028.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

The Xilinx UART Lite and MPC5200 Programmable Serial Controller (PSC)
devices have dedicated major/minor numbers.  Add them to the device
table data file so they get are present in the root filesystem
---

 target/generic/device_table.txt              |    2 ++
 target/generic/target_skeleton/etc/securetty |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)


diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index 1efc161..2016eb3 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -72,6 +72,8 @@
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
 #/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyPSC	c	666	0	0	204	148	0	1	4
+/dev/ttyUL	c	666	0	0	204	187	0	1	4
 
 # Input stuff
 /dev/input		d	755	0	0	-	-	-	-	-
diff --git a/target/generic/target_skeleton/etc/securetty b/target/generic/target_skeleton/etc/securetty
index 1b084ac..15288e8 100644
--- a/target/generic/target_skeleton/etc/securetty
+++ b/target/generic/target_skeleton/etc/securetty
@@ -14,3 +14,7 @@ ttyUL0
 ttyUL1
 ttyUL2
 ttyUL3
+ttyPSC0
+ttyPSC1
+ttyPSC2
+ttyPSC3
