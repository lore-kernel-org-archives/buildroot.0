From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:31:44 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] squid: add upstream
 security fix for SQUID-2018_5 / CVE-2018-19132
Message-ID: <20181126082834.0578C885BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7e6c2a19642ab49decb93af2f056cf90155a42c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

From the advisory:

 Due to a memory leak in SNMP query rejection code, Squid is
 vulnerable to a denial of service attack.

http://www.squid-cache.org/Advisories/SQUID-2018_5.txt

Add the patch from the 3.5 branch fixing this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 1 +
 package/squid/squid.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 6fd29b0dcc..74637ca063 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -3,4 +3,5 @@ md5 9367e0375ea53ba0e99f77054d4402c5 squid-3.5.28.tar.xz
 sha1 721241a270ec27d629d65ae17a50be56510e8441 squid-3.5.28.tar.xz
 # Locally calculated
 sha256 de5ea6fa5711aaa6d209de9e9e715c2702ff3597f009562ee1e571cc101670c7 squid-3.5-f1657a9decc820f748fa3aff68168d3145258031.patch
+sha256 8f2518b5e9840e119c493f6ed793e773675e2f768de2bf1bd637fced27e4d527 squid-3.5-bc9786119f058a76ddf0625424bc33d36460b9a2.patch
 sha256 58f5d05257af1fb964fde20e134d660fac9afa86b6fd8c70d63ead63068378fa COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 09dc107e01..cc40922bee 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -9,7 +9,8 @@ SQUID_VERSION = $(SQUID_VERSION_MAJOR).28
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_PATCH = \
-	http://www.squid-cache.org/Versions/v3/3.5/changesets/squid-3.5-f1657a9decc820f748fa3aff68168d3145258031.patch
+	http://www.squid-cache.org/Versions/v3/3.5/changesets/squid-3.5-f1657a9decc820f748fa3aff68168d3145258031.patch \
+	http://www.squid-cache.org/Versions/v3/3.5/changesets/squid-3.5-bc9786119f058a76ddf0625424bc33d36460b9a2.patch
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 # For 0001-assume-get-certificate-ok.patch
