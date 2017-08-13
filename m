From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Aug 2017 21:34:19 +0300
Subject: [Buildroot] [PATCH 3/3] whois: bump to version 5.2.17
In-Reply-To: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
Message-ID: <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes serious usability issues (Debian changelog):

  * Fixed whois referrals for .com, .net, .jobs, .bz, .cc and .tv,
    broken by an ICANN-mandated output change:
    https://www.icann.org/resources/pages/rdds-labeling-policy-2017-02-01-en

Use snapshot.debian.org for the .dsc reference, since files tend to
disappear from the official Debian ftp site over time.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

This should go to master IMO.
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 6f65074c2c48..29623b529f20 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,2 +1,2 @@
-# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.14.dsc
-sha256	a41daf41abed0fbfa8c9c4b0e4a3f5f22d9876dd6feb9091aac12f8f4c38b0d2	whois_5.2.14.tar.xz
+# From http://snapshot.debian.org/archive/debian/20170727T214450Z/pool/main/w/whois/whois_5.2.17.dsc
+sha256	257585678f571e18964667b41dc6543fe9da6123ac95743660c9c3ae1eba9664	whois_5.2.17.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 87cc65fac4c7..22117cf3aa88 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.2.14
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20161230T032015Z/pool/main/w/whois
+WHOIS_VERSION = 5.2.17
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20170727T214450Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
-- 
2.14.1
