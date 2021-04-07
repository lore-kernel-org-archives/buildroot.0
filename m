From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 20:41:14 +0200
Subject: [Buildroot] [git commit] package/avahi: ignore CVE-2021-26720
Message-ID: <20210407181658.D571C8198D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eadd7674061f6165b08ca0e99864e0cf26b090e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is part of
the Debian packaging and not part of upstream avahi - So ignore the CVE.

https://security-tracker.debian.org/tracker/CVE-2021-26720

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/avahi/avahi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index e2b27328cd..b71fc189a0 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -11,6 +11,10 @@ AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
 AVAHI_INSTALL_STAGING = YES
 
+# CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is
+# part of the Debian packaging and not part of upstream avahi
+AVAHI_IGNORE_CVES += CVE-2021-26720
+
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share
