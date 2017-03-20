From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Mon, 20 Mar 2017 11:25:09 +0100
Subject: [Buildroot] [PATCH] package/libkcapi: bump version to latest git
	hash 79cb80714ebc
Message-ID: <1490005509-9565-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure script is used to detect options supported by the target
compiler, but those options are then incorrectly used by the targets
compiled using a host compiler.

configure:
  checking whether CC supports -fstack-protector-strong... yes
make:
  /usr/bin/gcc (...)
  cc1: error: unrecognized command line option "-fstack-protector-strong"

Fixes:
  http://autobuild.buildroot.net/results/4c0/4c06dfa35ef52f6522619f797a9ae4e7a2e45d04/
  http://autobuild.buildroot.net/results/788/78886670cff406a09bd08808d9a6e328ee75634b/

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/libkcapi/libkcapi.hash | 2 +-
 package/libkcapi/libkcapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index e191970..00ee094 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	1ed007a35d9fe31383d1131e9f8e14af4df8d55e6c48828b5075324b2876364a	libkcapi-a039f8a5adca57dc69a19d7361600c2f410e0c26.tar.gz
+sha256	e2ebf660029a3565c17220530580d5579b8289bb41ea516a33bf86ef4941e05b	libkcapi-79cb80714ebcbae2b9de9bb5aca9a6a546f2f121.tar.gz
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 9488098..74edf2c 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = a039f8a5adca57dc69a19d7361600c2f410e0c26
+LIBKCAPI_VERSION = 79cb80714ebcbae2b9de9bb5aca9a6a546f2f121
 LIBKCAPI_SITE = $(call github,smuellerDD,libkcapi,$(LIBKCAPI_VERSION))
 LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
-- 
2.7.4
