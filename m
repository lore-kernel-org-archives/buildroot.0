From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:36:18 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/cifs-utils:
 security bump to version 6.13
Message-ID: <20210508142103.AFC7581503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=186e804dc8cdf954a9a8feb59cb132cf3bb56b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-20208: A flaw was found in cifs-utils in versions before
6.13. A user when mounting a krb5 CIFS file system from within a
container can use Kerberos credentials of the host. The highest threat
from this vulnerability is to data confidentiality and integrity.

https://lists.samba.org/archive/samba-technical/2021-April/136467.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0b332bb15cd83e0d9d19abb66c8a349024472706)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index cd7a9bba62..566a5c4bf4 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  922ddcc3059922e80789312c386b9c569991b4350d3ae3099de3e4b82f3885ef  cifs-utils-6.12.tar.bz2
+sha256  43d8786c8613caccfa84913081c1d62bc2409575854cf895b05b48af0863d056  cifs-utils-6.13.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 473e8a2c28..b29557cbe8 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.12
+CIFS_UTILS_VERSION = 6.13
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
