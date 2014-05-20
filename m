From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 May 2014 23:54:02 +0200
Subject: [Buildroot] [PATCH] build/sstrip: deprecate for 2014.05
Message-ID: <1400622842-30173-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Quoting Thomas on IRC:
  > sstrip is a piece of crap that we should exterminate
  > from the surface of the planet

sstrip is now unmaintained, has a long history of generating butchered
binaries in some cases, and does not gain that much space in the end.

We'd like to obliviate sstrip from the strip options, anihilate the
sstrip package, scorch any reference in fire, and cleanse our tree
free of any remnants...

But first, let's just deprecate it for now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
/me postpones getting his flamethrower out of the closet for one
more year... ;-)
---
 Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in b/Config.in
index 79a455d..d402c93 100644
--- a/Config.in
+++ b/Config.in
@@ -356,6 +356,7 @@ config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
 	depends on !BR2_PACKAGE_HOST_ELF2FLT
+	depends on BR2_DEPRECATED_SINCE_2014_05
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the 'sstrip' command, which strips a little
-- 
1.8.3.2
