From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 22:54:00 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/unzip: add
 security patch from Debian
Message-ID: <20190904204945.94AD98B670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9f2ce2f5afc7884b6683d508ae0bfe9d89243a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fix the URL and add a new patch. Quoting changelog [1]:

unzip (6.0-25) unstable; urgency=medium

  * Apply one more patch by Mark Adler:
  - Do not raise a zip bomb alert for a misplaced central directory.
    This should allow Firefox to build again. Closes: #932404.
    Reported by Peter Green. Hopefully CVE-2019-13232 is fixed now.

 -- Santiago Vila <sanvila@debian.org>  Sat, 27 Jul 2019 18:01:36 +0200

[1] https://sources.debian.org/data/main/u/unzip/6.0-25/debian/changelog

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8a1a7dff4f223b5f585ece8ec23929a0b7cf798c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unzip/unzip.hash |  1 +
 package/unzip/unzip.mk   | 33 +++++++++++++++++----------------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index 0c384d006e..a10778a468 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -16,3 +16,4 @@ sha256 4eabc3faeddd56ebc3d5053486b61f8758d840902725fd555d3472cffb094437 20-cve-2
 sha256 df3b0eeea8dcc161a2565e306b5dda13d27de43145e198baaf0eab822321ee7e 21-fix-warning-messages-on-big-files.patch
 sha256 2cf5a89e921da99e883bcde0ea03e2c77ae9185f57efaf35e7d43bc24353cfdc 22-cve-2019-13232-fix-bug-in-undefer-input.patch
 sha256 c8e82c80fc7760f90567118a465e4cfa1b8e5d0a5723f9c70e3d21247e550615 23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
+sha256 37ba0bea723beeb22670babda18bd980368cc6591bc7bd9caa04f62692c7e5ac 24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 2887b7b288..1d972055de 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -11,21 +11,22 @@ UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 
 UNZIP_PATCH = \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/07-increase-size-of-cfactorstr.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/08-allow-greater-hostver-values.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/09-cve-2014-8139-crc-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/11-cve-2014-8141-getzip64data.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/14-cve-2015-7696.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/15-cve-2015-7697.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/17-restore-unix-timestamps-accurately.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/21-fix-warning-messages-on-big-files.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/07-increase-size-of-cfactorstr.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/08-allow-greater-hostver-values.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/09-cve-2014-8139-crc-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/11-cve-2014-8141-getzip64data.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/14-cve-2015-7696.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/15-cve-2015-7697.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/17-restore-unix-timestamps-accurately.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/21-fix-warning-messages-on-big-files.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
 
 $(eval $(cmake-package))
