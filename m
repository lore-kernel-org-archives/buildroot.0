From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 15:01:14 +0200
Subject: [Buildroot] [PATCH 1/2] bind: bump to version 9.11.2
Message-ID: <20170913130115.25010-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for the new ICANN DNSSEC root key for the upcoming KSK rollover
(Oct 11):

https://www.icann.org/resources/pages/ksk-rollover

For more details, see the release notes:
https://kb.isc.org/article/AA-01522

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 3a631def65..95362309e1 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,3 +1,3 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.1-P3/bind-9.11.1-P3.tar.gz.sha256.asc
-sha256 52426e75432e46996dc90f24fca027805a341c38fbbb022b60dc9acd2677ccf4 bind-9.11.1-P3.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.2/bind-9.11.2.tar.gz.sha256.asc
+sha256 7f46ad8620f7c3b0ac375d7a5211b15677708fda84ce25d7aeb7222fe2e3c77a bind-9.11.2.tar.gz
 sha256 d3906dfe153e2c48440d3ca1d5319f5e89b4b820cdfc5d0779c23d7ac2b175e9 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c65568e9e3..97d98d0b21 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.1-P3
+BIND_VERSION = 9.11.2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.11.0
