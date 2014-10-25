From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:48:44 +0200
Subject: [Buildroot] [git commit] glibc/nsswitch.conf: also lookup on dns
	for networks
Message-ID: <20141025104850.84F7CAC7E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eceb61a9a20a4d71efded8421468c1670ae73bbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/nsswitch.conf |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/glibc/nsswitch.conf b/package/glibc/nsswitch.conf
index d81e2f0..5c38491 100644
--- a/package/glibc/nsswitch.conf
+++ b/package/glibc/nsswitch.conf
@@ -1,17 +1,13 @@
 # /etc/nsswitch.conf
-#
-# Example configuration of GNU Name Service Switch functionality.
-# If you have the `glibc-doc-reference' and `info' packages installed, try:
-# `info libc "Name Service Switch"' for information about this file.
 
 passwd:         files
 group:          files
 shadow:         files
+
 hosts:          files dns
-networks:       files
+networks:       files dns
 
 protocols:      files
 services:       files
 ethers:         files
 rpc:            files
-
