From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  2 Jul 2017 17:01:48 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.1-P2
Message-ID: <20170702150148.22879-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2017-3142: An error in TSIG authentication can permit unauthorized zone
transfers

An attacker who is able to send and receive messages to an authoritative DNS
server and who has knowledge of a valid TSIG key name may be able to
circumvent TSIG authentication of AXFR requests via a carefully constructed
request packet. A server that relies solely on TSIG keys for protection with
no other ACL protection could be manipulated into:

* providing an AXFR of a zone to an unauthorized recipient
* accepting bogus NOTIFY packets

https://kb.isc.org/article/AA-01504/74/CVE-2017-3142

CVE-2017-3041: An error in TSIG authentication can permit unauthorized dynamic
updates

An attacker who is able to send and receive messages to an authoritative DNS
server and who has knowledge of a valid TSIG key name for the zone and service
being targeted may be able to manipulate BIND into accepting an unauthorized
dynamic update.

https://kb.isc.org/article/AA-01503/74/CVE-2017-3143

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 3f0dda531a..5dd15cb86b 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.1-P1/bind-9.11.1-P1.tar.gz.sha256.asc
-sha256 6b1b3e88d51b8471bd6aee24a8cea70817e850a5901315dc506f9dde275ca638 bind-9.11.1-P1.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.1-P1/bind-9.11.1-P2.tar.gz.sha256.asc
+sha256 bf53c6431575ae1612ddef66d18ef9baf2a22d842fa5b0cadc971919fd81fea5 bind-9.11.1-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b588eb5223..fd5369a3ea 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.1-P1
+BIND_VERSION = 9.11.1-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.11.0
