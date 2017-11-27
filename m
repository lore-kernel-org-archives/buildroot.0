From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:47:51 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] samba4: security bump to
 version 4.5.15
Message-ID: <20171127094036.5B7EF815CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=520e584c48d684d5f1e54f394ffad1b6240003af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

- CVE-2017-14746:
  All versions of Samba from 4.0.0 onwards are vulnerable to a use after
  free vulnerability, where a malicious SMB1 request can be used to
  control the contents of heap memory via a deallocated heap pointer. It
  is possible this may be used to compromise the SMB server.

- CVE-2017-15275:
  All versions of Samba from 3.6.0 onwards are vulnerable to a heap
  memory information leak, where server allocated heap memory may be
  returned to the client without being cleared.

  There is no known vulnerability associated with this error, but
  uncleared heap memory may contain previously used data that may help
  an attacker compromise the server via other methods. Uncleared heap
  memory may potentially contain password hashes or other high-value
  data.

For more details, see the release notes:
https://www.samba.org/samba/history/samba-4.5.15.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 847be87..cddecd9 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  15dc04fd2b19081daf1118318f43f88ef7260b3fc6e4f86ee7c7913bb7c92ed9 samba-4.5.14.tar.gz
+sha256  811bf727892a1e1e3d170eb72eb39c43d06ed8ff557e5e036a41aabc19008e94 samba-4.5.15.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e4778d0..c8b1e5a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.14
+SAMBA4_VERSION = 4.5.15
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
