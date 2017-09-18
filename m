From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Sep 2017 09:47:56 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] unrar: security bump to
	version 5.5.8
Message-ID: <20170918074221.E44FC8103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59e03d863d6bb824be3e882d654c1d4c5d8c65b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

CVE-2017-12938 - UnRAR before 5.5.7 allows remote attackers to bypass a
directory-traversal protection mechanism via vectors involving a symlink to
the . directory, a symlink to the .. directory, and a regular file.

CVE-2017-12940 - libunrar.a in UnRAR before 5.5.7 has an out-of-bounds read
in the EncodeFileName::Decode call within the Archive::ReadHeader15
function.

CVE-2017-12941 - libunrar.a in UnRAR before 5.5.7 has an out-of-bounds read
in the Unpack::Unpack20 function.

CVE-2017-12942 - libunrar.a in UnRAR before 5.5.7 has a buffer overflow in
the Unpack::LongLZ function.

For more details, see
http://www.openwall.com/lists/oss-security/2017/08/14/3

While we're at it, add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 322599744ca76d6b69960dc37c3cf3baea5dab2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unrar/unrar.hash | 3 ++-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 36450e0..81688d7 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	e470c584332422893fb52e049f2cbd99e24dc6c6da971008b4e2ae4284f8796c	unrarsrc-5.4.5.tar.gz
+sha256	9b66e4353a9944bc140eb2a919ff99482dd548f858f5e296d809e8f7cdb2fcf4	unrarsrc-5.5.8.tar.gz
+sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index f5a95ea..d6c97df 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.4.5
+UNRAR_VERSION = 5.5.8
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
