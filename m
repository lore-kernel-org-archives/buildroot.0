From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 21:10:48 +0100
Subject: [Buildroot] [git commit] package/opusfile: bump to version 0.11
Message-ID: <20190101200759.238EC8843A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4253ad093e367d1d627518e5e9a4091f50cc19de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since the v0.10 release:

- Fix two potential integer overflows. (These were not
  security-critical unless the compiler took the opportunity provided
  by the undefined behavior to format your hard drive.)
- Allow JPEGs in METADATA_BLOCK_PICTURE tags to include EXIF data.
- A few warning fixes for gcc 8.
- Make opus_tags_copy return OP_EFAULT on failure instead of returning
  success.
- Various integration and testing environment improvements.

This release is backward-compatible with the previous release. We
recommend all users upgrade.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opusfile/opusfile.hash | 2 +-
 package/opusfile/opusfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index f1fcf5f9d6..e9ecf83feb 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f  opusfile-0.10.tar.gz
+sha256 74ce9b6cf4da103133e7b5c95df810ceb7195471e1162ed57af415fabf5603bf  opusfile-0.11.tar.gz
 
 # Hash for license file
 sha256 0267ae795ab744c4e0f9c45e249440fdf2e75dac8c804f36066b28649bf74aaf  COPYING
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 0cfe623941..49a53b3958 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUSFILE_VERSION = 0.10
+OPUSFILE_VERSION = 0.11
 OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
