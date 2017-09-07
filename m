From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  7 Sep 2017 18:58:38 +0200
Subject: [Buildroot] [PATCH] unrar: security bump to version 5.5.8
Message-ID: <20170907165838.10399-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/unrar/unrar.hash | 3 ++-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 36450e05e3..81688d7b7d 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	e470c584332422893fb52e049f2cbd99e24dc6c6da971008b4e2ae4284f8796c	unrarsrc-5.4.5.tar.gz
+sha256	9b66e4353a9944bc140eb2a919ff99482dd548f858f5e296d809e8f7cdb2fcf4	unrarsrc-5.5.8.tar.gz
+sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index f5a95eacc5..d6c97dff2c 100644
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
-- 
2.11.0
