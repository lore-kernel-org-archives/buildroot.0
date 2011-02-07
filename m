From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Feb 2011 14:34:28 +0100
Subject: [Buildroot] [git commit master 1/1] debugging: do not require no
	stripping
Message-ID: <20110207133511.DA7348F409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=febe322d273e1f9538aa124861badc0df2e52742
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The stripping options operate on the final image and not the intermediate
builds, so requiring stripping to be disabled just to enable debugging
options doesn't make much sense.  Especially when working with gdbserver:
only the host needs the debugging information to be available.  The board
can run & debug perfectly fine without it.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index af26bbe..c992c5b 100644
--- a/Config.in
+++ b/Config.in
@@ -219,14 +219,14 @@ choice
 
 config BR2_STRIP_strip
 	bool "strip"
-	depends on !BR2_ENABLE_DEBUG && !BR2_ELF2FLT
+	depends on !BR2_ELF2FLT
 	help
 	  strip   is the normal strip command
 
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_ENABLE_DEBUG && !BR2_ELF2FLT
+	depends on !BR2_ELF2FLT
 	help
 	  sstrip  is a strip that discards more than the normal strip
 
-- 
1.7.3.4
