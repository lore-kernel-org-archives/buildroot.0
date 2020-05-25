From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 23:48:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/tpm2-abrmd: bump version to 2.3.2
Message-ID: <20200525214853.14277-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes various initialization / systemd issues. From the changelog:

- Provide meaningful exit codes on initialization failures.
- Prevent systemd from starting the daemon before udev changes ownership of
  the TPM device node.
- Prevent systemd from starting the daemon if there is no TPM device node.
- Prevent systemd from restarting the daemon if it fails.
- Add SELinux policy to allow daemon to resolve names.
- Add SELinux policy boolean (disabled by default) to allow daemon to
  connect to all unreserved ports.

Also adjust .hash file white space to match new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.hash | 4 ++--
 package/tpm2-abrmd/tpm2-abrmd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index cff3266bc8..f69cd369bf 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 63cb59be1fd21e6ae233c37a0aa4a59883a4885a7bfd2c7e69979c5048518d50  tpm2-abrmd-2.3.0.tar.gz
-sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
+sha256  df02c18882116e19b56aa8c701687c0c0987dd334e6fc002b340cedf6e000d10  tpm2-abrmd-2.3.2.tar.gz
+sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index e92fda252a..9d22219f67 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 2.3.0
+TPM2_ABRMD_VERSION = 2.3.2
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
-- 
2.20.1
