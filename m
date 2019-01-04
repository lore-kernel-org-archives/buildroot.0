From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri,  4 Jan 2019 16:46:27 +0100
Subject: [Buildroot] [PATCH 1/1] strace: bump to version 4.26
Message-ID: <20190104154627.9472-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The licence changed from BSD to LGPL 2.1 or later, update this
accordingly.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/strace/strace.hash | 7 ++++---
 package/strace/strace.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

runtime-tested on an arm with uclibc.

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index f7d652faaa..fe58f2391a 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/4.25/strace-4.25.tar.xz.asc
-sha256	d685f8e65470b7832c3aff60c57ab4459f26ff89f07c10f92bd70ee89efac701	strace-4.25.tar.xz
-sha256	df862ba273812c589fd69acc74197a25d38c5295baccab00a62d39d1894c0253	COPYING
+# https://strace.io/files/4.26/strace-4.26.tar.xz
+sha256	7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c	strace-4.26.tar.xz
+sha256	ba6d645dfe0f5e13bf1f117f0595e90076b845fc9aaa1d5778699792bb2d70b2	COPYING
+sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index fe7acff1e0..afcd5e71f0 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.25
+STRACE_VERSION = 4.26
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
-STRACE_LICENSE = BSD-3-Clause
-STRACE_LICENSE_FILES = COPYING
+STRACE_LICENSE = LGPL-2.1+
+STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CONF_OPTS = --enable-mpers=check
 
 # strace bundle some kernel headers to build libmpers, this mixes userspace
-- 
2.20.1
