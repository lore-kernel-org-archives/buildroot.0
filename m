From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:40:30 +0200
Subject: [Buildroot] [git commit] perl-sys-cpu: disable in static
 configurations
Message-ID: <20181008195432.77F0D8E53E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a90775e980e1b7eab0339095cf13503152954c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The perl-sys-cpu package builds a native shared library, which makes
it incompatible with static-only configurations.

Fixes:

  http://autobuild.buildroot.net/results/ea64c2d8022932162d36301ca4061f61cd208c11/

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-sys-cpu/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.in
index a604945740..8306b371dc 100644
--- a/package/perl-sys-cpu/Config.in
+++ b/package/perl-sys-cpu/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_PERL_SYS_CPU
 	bool "perl-sys-cpu"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Perl module for getting information about the system CPU
 	  (Sys::CPU).
+
+comment "perl-sys-cpu needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
