From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:51 +0100
Subject: [Buildroot] [PATCH 11/15] elfutils: towards uClibc support:
	requires largefile
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fbfe64be9e244f12b3c20c8bc7333dd16f6b2e1d.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elfutils unconditionally uses off64_t for example, so largefile is
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.9.5
