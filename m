From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Apr 2019 20:16:16 +0200
Subject: [Buildroot] [PATCH] package/apache: security bump to version 2.4.39
Message-ID: <20190402181616.20819-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

  *) SECURITY: CVE-2019-0197 (cve.mitre.org)
     mod_http2: fixes a possible crash when HTTP/2 was enabled for a http:
     host or H2Upgrade was enabled for h2 on a https: host. An Upgrade
     request from http/1.1 to http/2 that was not the first request on a
     connection could lead to a misconfiguration and crash. Servers that
     never enabled the h2 protocol or only enabled it for https: and
     did not set "H2Upgrade on" are unaffected by this issue.
     [Stefan Eissing]

  *) SECURITY: CVE-2019-0196 (cve.mitre.org)
     mod_http2: using fuzzed network input, the http/2 request
     handling could be made to access freed memory in string
     comparision when determining the method of a request and
     thus process the request incorrectly. [Stefan Eissing]

  *) SECURITY: CVE-2019-0211 (cve.mitre.org)
     MPMs unix: Fix a local priviledge escalation vulnerability by not
     maintaining each child's listener bucket number in the scoreboard,
     preventing unprivileged code like scripts run by/on the server (e.g. via
     mod_php) from modifying it persistently to abuse the priviledged main
     process.  [Charles Fol <folcharles gmail.com>, Yann Ylavic]

  *) SECURITY: CVE-2019-0196 (cve.mitre.org)
     mod_http2: using fuzzed network input, the http/2 request
     handling could be made to access freed memory in string
     comparision when determining the method of a request and
     thus process the request incorrectly. [Stefan Eissing]

  *) SECURITY: CVE-2019-0217 (cve.mitre.org)
     mod_auth_digest: Fix a race condition checking user credentials which
     could allow a user with valid credentials to impersonate another,
     under a threaded MPM.  PR 63124.  [Simon Kappel <simon.kappel axis.com>]

  *) SECURITY: CVE-2019-0215 (cve.mitre.org)
     mod_ssl: Fix access control bypass for per-location/per-dir client
     certificate verification in TLSv1.3.

  *) SECURITY: CVE-2019-0220 (cve.mitre.org)
     Merge consecutive slashes in URL's. Opt-out with
     `MergeSlashes OFF`. [Eric Covener]

For more details, see the CHANGES file:
https://www.apache.org/dist/httpd/CHANGES_2.4.39

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index fd42cd4872..0c3a1d5303 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.38.tar.bz2.sha256
-sha256 7dc65857a994c98370dc4334b260101a7a04be60e6e74a5c57a6dee1bc8f394a httpd-2.4.38.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.39.tar.bz2.sha256
+sha256 b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2 httpd-2.4.39.tar.bz2
 # Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index dd8f175f9c..ebb28b653a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.38
+APACHE_VERSION = 2.4.39
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.11.0
