From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:43:46 +0100
Subject: [Buildroot] [git commit] elfutils: towards uClibc support: requires
	largefile
Message-ID: <20130107212532.694089A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4031ecfdff7fb2a9d58e3b341d1fd6d11eeabe7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils unconditionally uses off64_t for example, so largefile is
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index ee1e4ab..5ec4ca9 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_ELFUTILS
 	       BR2_TOOLCHAIN_BUILDROOT   || \
 	       BR2_TOOLCHAIN_CTNG_uClibc || \
 	       BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on BR2_LARGEFILE
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
