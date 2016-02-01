From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 19:32:43 +0100
Subject: [Buildroot] [git commit] uclibc: update uClibc-ng to 1.0.12
Message-ID: <20160201224702.253C47F9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bfb215681e134e9dc44e43ce417104bf35091b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New release contains a security fix for the resolver library parts.
It contains exp10(), so some patches in buildroot might be obsolete,
when the buildroot toolchains are rebuilt.
It also contains a fix for the symbol clashing with bind9.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.hash | 2 +-
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index ecc8cf9..1290f92 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  2fdc6b9015f8049be0eb12a5e3e446de471fb80061115afd8d72ea582cb22b74        uClibc-ng-1.0.11.tar.xz
+sha256  c238b300356b2638432e023076293f29935094108a2714ad1762b76015fae729        uClibc-ng-1.0.12.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 6b05181..773b22a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.11
+UCLIBC_VERSION = 1.0.12
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
