From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:30:38 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] squid: add upstream
 security fix for SQUID-2018_4 / CVE-2018-19131
Message-ID: <20181126082806.4A68988516@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ee8a9a781986f74d5b73b0b4651aa18afbe7aa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

From the advisory:

Due to incorrect input handling, Squid is vulnerable to a
Cross-Site Scripting vulnerability when generating HTTPS response
messages about TLS errors.

http://www.squid-cache.org/Advisories/SQUID-2018_4.txt

Add the patch from the 3.5 branch fixing this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 1 +
 package/squid/squid.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 3c0a2734e5..6fd29b0dcc 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -2,4 +2,5 @@
 md5 9367e0375ea53ba0e99f77054d4402c5 squid-3.5.28.tar.xz
 sha1 721241a270ec27d629d65ae17a50be56510e8441 squid-3.5.28.tar.xz
 # Locally calculated
+sha256 de5ea6fa5711aaa6d209de9e9e715c2702ff3597f009562ee1e571cc101670c7 squid-3.5-f1657a9decc820f748fa3aff68168d3145258031.patch
 sha256 58f5d05257af1fb964fde20e134d660fac9afa86b6fd8c70d63ead63068378fa COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index a921c634bd..f49b3604cf 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -8,6 +8,8 @@ SQUID_VERSION_MAJOR = 3.5
 SQUID_VERSION = $(SQUID_VERSION_MAJOR).28
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
+SQUID_PATCH = \
+	http://www.squid-cache.org/Versions/v3/3.5/changesets/squid-3.5-f1657a9decc820f748fa3aff68168d3145258031.patch
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 # For 0001-assume-get-certificate-ok.patch
