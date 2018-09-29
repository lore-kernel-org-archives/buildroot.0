From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Sep 2018 21:30:39 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.4-P2
Message-ID: <20180929193039.29827-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes
(http://ftp.isc.org/isc/bind9/9.11.4-P2/RELEASE-NOTES-bind-9.11.4-P2.txt):

 * There was a long-existing flaw in the documentation for ms-self,
   krb5-self, ms-subdomain, and krb5-subdomain rules in update-policy
   statements.  Though the policies worked as intended, operators who
   configured their servers according to the misleading documentation may
   have thought zone updates were more restricted than they were; users of
   these rule types are advised to review the documentation and correct
   their configurations if necessary.  New rule types matching the
   previously documented behavior will be introduced in a future maintenance
   release.  [GL !708]

 * named could crash during recursive processing of DNAME records when
   deny-answer-aliases was in use.  This flaw is disclosed in CVE-2018-5740.
   [GL #387]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 2 +-
 package/bind/bind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 34d9891805..19d5f61f6d 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
 # Verified from https://ftp.isc.org/isc/bind9/9.11.4-P1/bind-9.11.4-P1.tar.gz.asc
 # with key BE0E9748B718253A28BB89FFF1B11BF05CF02E57
-sha256 b0e0dc3c8bf26989b1cad53f90d44a48e39404afc68f65c45bae79b446f0fe23 bind-9.11.4-P1.tar.gz
+sha256 a85af7b629109d41285c7adeae1515daac638bbe4d5dc30d1f4b343dff09d811 bind-9.11.4-P2.tar.gz
 sha256 336f3c40e37a1a13690efb4c63e20908faa4c40498cc02f3579fb67d3a1933a5 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0140041218..95f615bf81 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.4-P1
+BIND_VERSION = 9.11.4-P2
 BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.11.0
