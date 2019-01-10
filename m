From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Jan 2019 13:31:46 +0100
Subject: [Buildroot] [PATCH] patchelf: update _SITE to new location
Message-ID: <20190110123146.554-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

releases.nixos.org gives some weird XML pages. The upstream location is
nixos.org/releases.

This side uses HSTS, so switch to https to avoid a needless redirect.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/patchelf/patchelf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 74e6cccdbe..52912e295b 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PATCHELF_VERSION = 0.9
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION)
+PATCHELF_SITE = https://nixos.org/releases/patchelf/patchelf-$(PATCHELF_VERSION)
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
-- 
2.20.1
