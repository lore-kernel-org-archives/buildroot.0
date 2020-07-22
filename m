From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 14:13:47 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/python3: security
 bump to version 3.8.4
Message-ID: <20200722121824.CC74B81682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87b8b6f54e2edc8a784d09729fb85211b3b249ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes the following security issues:

- bpo-41162: Audit hooks are now cleared later during finalization to avoid
  missing events.

- bpo-29778: Ensure python3.dll is loaded from correct locations when Python
  is embedded (CVE-2020-15523).

- bpo-41004: The __hash__() methods of ipaddress.IPv4Interface and
  ipaddress.IPv6Interface incorrectly generated constant hash values of 32
  and 128 respectively.  This resulted in always causing hash collisions.
  The fix uses hash() to generate hash values for the tuple of (address,
  mask length, network address).

- bpo-39073: Disallow CR or LF in email.headerregistry.Address arguments to
  guard against header injection attacks.

For more details, see the changelog:
https://docs.python.org/release/3.8.4/whatsnew/changelog.html#security

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d6ff343d67383df37c0e6f1f8ec64464a1be467b)
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index fc34e8aa59..2ca3f5a335 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-383/
-md5  3000cf50aaa413052aef82fd2122ca78  Python-3.8.3.tar.xz
+# From https://www.python.org/downloads/release/python-384/
+md5  e16df33cd7b58702e57e137f8f5d13e7  Python-3.8.4.tar.xz
 # Locally computed
-sha256  dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864  Python-3.8.3.tar.xz
+sha256  5f41968a95afe9bc12192d7e6861aab31e80a46c46fa59d3d837def6a4cd4d37  Python-3.8.4.tar.xz
 sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4e43027cff..b79d320cbf 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
