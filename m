From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:15:42 +0100
Subject: [Buildroot] [git commit] bind: security bump to version 9.11.0-P2
Message-ID: <20170113152114.6A3517F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bab93be70ba576668a9fa19d0ff92ce2b97c905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfixes:

 - CVE-2016-9131: A malformed response to an ANY query can cause an
   assertion failure during recursion

 - CVE-2016-9147: An error handling a query response containing inconsistent
   DNSSEC information could cause an assertion failure

 - CVE-2016-9444: An unusually-formed DS record response could cause an
   assertion failure

 - CVE-2016-9778: An error handling certain queries using the
   nxdomain-redirect feature could cause a REQUIRE assertion failure in db.c

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 3522149..dc472b1 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P1/bind-9.11.0-P1.tar.gz.sha256.asc
-sha256 094cd3134ba1b44f0910de1334f05a7dca68d583da038de40a8ad7a0cb1592c6  bind-9.11.0-P1.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P2/bind-9.11.0-P2.tar.gz.sha256.asc
+sha256 d651f83ce1c08c83d6ac8201685c4f2b5fdb79794f3a4f93c3948e0ef439c1e5  bind-9.11.0-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ee50acf..7143089 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.0-P1
+BIND_VERSION = 9.11.0-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
