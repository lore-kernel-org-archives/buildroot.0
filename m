From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:33:42 +0200
Subject: [Buildroot] [git commit] bind: bump version to bugfix release
	9.11.1-P3
Message-ID: <20170724162933.22BDC81F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c237f1d1c5447af3b967304d7929cf115ea1aa5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BIND 9.11.1-P3 addresses a TSIG regression introduced in the 9.11.1-P2
security bump:

https://lists.isc.org/pipermail/bind-announce/2017-July/001057.html

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.hash | 5 +++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 5dd15cb..3a631de 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,3 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.1-P1/bind-9.11.1-P2.tar.gz.sha256.asc
-sha256 bf53c6431575ae1612ddef66d18ef9baf2a22d842fa5b0cadc971919fd81fea5 bind-9.11.1-P2.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.1-P3/bind-9.11.1-P3.tar.gz.sha256.asc
+sha256 52426e75432e46996dc90f24fca027805a341c38fbbb022b60dc9acd2677ccf4 bind-9.11.1-P3.tar.gz
+sha256 d3906dfe153e2c48440d3ca1d5319f5e89b4b820cdfc5d0779c23d7ac2b175e9 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index fd5369a..988f40e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.1-P2
+BIND_VERSION = 9.11.1-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
