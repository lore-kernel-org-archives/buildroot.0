From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:52:03 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/dovecot: security
 bump version to 2.3.11.3
Message-ID: <20200828164643.74F1585FE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=691d2e133432ea1908047e88c09d9c791d87a8df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Release notes:
https://dovecot.org/pipermail/dovecot-news/2020-August/000440.html

Fixes the following CVEs:

* CVE-2020-12100: Parsing mails with a large number of MIME parts could
  have resulted in excessive CPU usage or a crash due to running out of
  stack memory.
* CVE-2020-12673: Dovecot's NTLM implementation does not correctly check
  message buffer size, which leads to reading past allocation which can
  lead to crash.
* CVE-2020-10967: lmtp/submission: Issuing the RCPT command with an
  address that has the empty quoted string as local-part causes the lmtp
  service to crash.
* CVE-2020-12674: Dovecot's RPA mechanism implementation accepts
  zero-length message, which leads to assert-crash later on.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6db0ea91ef94f6a6f3f5c4d1847733cd23679587)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 09295816d3..e5c2ab6f40 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  6642e62f23b1b23cfac235007ca6e21cb67460cca834689fad450724456eb10c  dovecot-2.3.10.1.tar.gz
+sha256  d3d9ea9010277f57eb5b9f4166a5d2ba539b172bd6d5a2b2529a6db524baafdc  dovecot-2.3.11.3.tar.gz
 sha256  a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 59b52a3f84..f0508753a2 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).10.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).11.3
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
