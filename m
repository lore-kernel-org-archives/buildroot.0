From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:31:58 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/openssh: security
 bump to version 8.6p1
Message-ID: <20210517210900.2941283A58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07af28fa6823ccd3b318b7bae8f09f49504a8541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Security
========

 * sshd(8): OpenSSH 8.5 introduced the LogVerbose keyword. When this
   option was enabled with a set of patterns that activated logging
   in code that runs in the low-privilege sandboxed sshd process, the
   log messages were constructed in such a way that printf(3) format
   strings could effectively be specified the low-privilege code.

   An attacker who had sucessfully exploited the low-privilege
   process could use this to escape OpenSSH's sandboxing and attack
   the high-privilege process. Exploitation of this weakness is
   highly unlikely in practice as the LogVerbose option is not
   enabled by default and is typically only used for debugging. No
   vulnerabilities in the low-privilege process are currently known
   to exist.

https://www.openssh.com/txt/release-8.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 12916827e0d4a31b29031102edf21fe5ab6a2f2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index c50a49896c..0dcd725de5 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.5 (base64 encoded)
-sha256  f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25  openssh-8.5p1.tar.gz
+# From https://www.openssh.com/txt/release-8.6 (base64 encoded)
+sha256  c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae  openssh-8.6p1.tar.gz
 # Locally calculated
 sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 055c024cab..61b2c97cf4 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.5
+OPENSSH_VERSION_MAJOR = 8.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
