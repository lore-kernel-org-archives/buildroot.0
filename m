From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2019 16:17:17 +0100
Subject: [Buildroot] [PATCH 04/11] package/ipsec-tools: add license
 information
In-Reply-To: <20191113151724.12155-1-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
Message-ID: <20191113151724.12155-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tarball unfortunately does not include a dedicated license file, so
instead use the main source file for the setkey command.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/ipsec-tools.hash | 3 +++
 package/ipsec-tools/ipsec-tools.mk   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/ipsec-tools/ipsec-tools.hash b/package/ipsec-tools/ipsec-tools.hash
index b12bea9477..7a944eb8ee 100644
--- a/package/ipsec-tools/ipsec-tools.hash
+++ b/package/ipsec-tools/ipsec-tools.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/0.8.2/
 md5	d53ec14a0a3ece64e09e5e34b3350b41	ipsec-tools-0.8.2.tar.bz2
 sha1	7d92cae9fde59fb4f125636698c43b0a3df3d0f0	ipsec-tools-0.8.2.tar.bz2
+
+# Locally calculated
+sha256	3f4af4aef0b2599928bee9875935b8fad8449ddbb98ea7da74c20c3dff5cdef7  src/setkey/setkey.c
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 7ac6b5cb22..634d752661 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -7,6 +7,8 @@
 IPSEC_TOOLS_VERSION = 0.8.2
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
+IPSEC_TOOLS_LICENSE = BSD-3-Clause
+IPSEC_TOOLS_LICENSE_FILES = src/setkey/setkey.c
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-pkgconf host-flex host-bison
-- 
2.20.1
