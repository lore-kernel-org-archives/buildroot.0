From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 16:39:37 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dnsmasq: security
 bump to 2.83
Message-ID: <20210204152012.160DE826AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8e8007ee07c6a41d5efd8c20763d1d0a61a02e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

From the annoucement:
http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q1/014599.html

"There are broadly two sets of problems. The first is subtle errors in
dnsmasq's protections against the chronic weakness of the DNS protocol
to cache-poisoning attacks; the Birthday attack, Kaminsky, etc. [...]

[...] the second set of errors is a good old fashioned buffer overflow
in dnsmasq's DNSSEC code."

Fixes CVE-2020-25681, CVE-2020-25682, CVE-2020-25683, CVE-2020-25684,
      CVE-2020-25685, CVE-2020-25686 and CVE-2020-25687

Details: https://www.jsof-tech.com/disclosures/dnspooq

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5cd5d85cdab72b2e62d1daca6311f480a7e68546)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 401f930baf..6c19dad791 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.82.tar.xz.asc
-sha256  84523646f3116bb5e1151efb66e645030f6e6a8256f29aab444777a343ebc132  dnsmasq-2.82.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.83.tar.xz.asc
+sha256  ffc1f7e8b05e22d910b9a71d09f1128197292766dc7c54cb7018a1b2c3af4aea  dnsmasq-2.83.tar.xz
 # Locally calculated
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 117be38d4b..4d03abd7e1 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.82
+DNSMASQ_VERSION = 2.83
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
