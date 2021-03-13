From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:58:39 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/openssh: bump to
 version 8.2p1
Message-ID: <20210313143654.3759883C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dfd8067b712bca730b1ca9556b804f5f4b000b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This new version is mandatory to allow the glibc package bump to version 2.31.
Otherwise it's not possible to connect to the remote host, as reported by [1] [2].
Upstream commit [3][4] fixes the issue.

[1] https://bugs.archlinux.org/task/65386
[2] https://bugs.gentoo.org/708224
[3] https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
[4] https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630

Release Note:
https://www.openssh.com/txt/release-8.2

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bad75bca315dbd2c69f8a9cb02fa9f27636e3d48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 4db933f7b0..2f962d4337 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.1 (base64 encoded)
-sha256 02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff  openssh-8.1p1.tar.gz
+# From https://www.openssh.com/txt/release-8.2 (base64 encoded)
+sha256 43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671  openssh-8.2p1.tar.gz
 # Locally calculated
 sha256 73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 9720fcdb0e..b4651b5971 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 8.1p1
+OPENSSH_VERSION = 8.2p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
