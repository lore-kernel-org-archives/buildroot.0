From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:51:01 +0200
Subject: [Buildroot] [git commit] perl-crypt-cbc: add missing license
 declaration
Message-ID: <20180727214915.3B91A8A4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04e4e9d5811a8013b1daaeb3683e7ee08828d9eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the license as found in the actual source file, and remove the README
from _LICENSE_FILES as it does not contain anything regarding licenses.

Note that adding the source file as LICENSE_FILE means that the
corresponding hash will be different on every version bump.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-crypt-cbc/perl-crypt-cbc.hash | 4 ++--
 package/perl-crypt-cbc/perl-crypt-cbc.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.hash b/package/perl-crypt-cbc/perl-crypt-cbc.hash
index f3d5e03c31..a54772a504 100644
--- a/package/perl-crypt-cbc/perl-crypt-cbc.hash
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.hash
@@ -2,5 +2,5 @@
 md5    3db5117d60df67e3b400fe367e716be0 Crypt-CBC-2.33.tar.gz
 sha256 6a70de21b6cc7f2b100067e8e188db966e9a8001b5db6fa976e7cb5b294ae645 Crypt-CBC-2.33.tar.gz
 
-# computed by scancpan
-sha256 a98da8a2eef02a8823cf2f58111e981796c4aaf38e8d446acd338a559af42bfc README
+# locally computed
+sha256 9548d0beb746167270df647aa97a3e47b957adb4ec103c2cfb8f54b0005f99c7 CBC.pm
diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.mk b/package/perl-crypt-cbc/perl-crypt-cbc.mk
index 3da0561096..749499c26b 100644
--- a/package/perl-crypt-cbc/perl-crypt-cbc.mk
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_CBC_VERSION = 2.33
 PERL_CRYPT_CBC_SOURCE = Crypt-CBC-$(PERL_CRYPT_CBC_VERSION).tar.gz
 PERL_CRYPT_CBC_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
-PERL_CRYPT_CBC_LICENSE_FILES = README
+PERL_CRYPT_CBC_LICENSE = Artistic
+PERL_CRYPT_CBC_LICENSE_FILES = CBC.pm
 
 $(eval $(perl-package))
