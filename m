From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:46:28 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] bind: security bump to
 version 9.11.2-P1
Message-ID: <20180130225021.A65C088155@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c87c3baf4651f29433c6040d6d4c8b49a9046ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issue:

CVE-2017-3145: Improper sequencing during cleanup can lead to a
use-after-free error, triggering an assertion failure and crash in
named.

For more details, see the advisory:
https://lists.isc.org/pipermail/bind-announce/2018-January/001072.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d72a2b9247d885c4fc5c2ca6066d3ae6a27a8653)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 95362309e1..199db704fe 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,3 +1,3 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.2/bind-9.11.2.tar.gz.sha256.asc
-sha256 7f46ad8620f7c3b0ac375d7a5211b15677708fda84ce25d7aeb7222fe2e3c77a bind-9.11.2.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.2-P1/bind-9.11.2-P1.tar.gz.sha256.asc
+sha256 cec31548832fca3f85d95178d4019b7d702039e8595d4c93914feba337df1212 bind-9.11.2-P1.tar.gz
 sha256 d3906dfe153e2c48440d3ca1d5319f5e89b4b820cdfc5d0779c23d7ac2b175e9 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 4465a2f73c..570f719dcd 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.2
+BIND_VERSION = 9.11.2-P1
 BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
