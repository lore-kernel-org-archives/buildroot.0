From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Tue, 12 May 2020 15:28:55 +0200
Subject: [Buildroot] [PATCH 2/6] package/mesa3d-headers: make it a provider
 for libgl-headers
In-Reply-To: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
References: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
Message-ID: <20200512132859.15189-2-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first - and most obvious - provider for GL API headers.
Should work as usual, transparently for any package requirung it,
used mostly where Mesa itself can't be installed.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
---
 package/mesa3d-headers/Config.in         | 7 +++++++
 package/mesa3d-headers/mesa3d-headers.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/mesa3d-headers/Config.in b/package/mesa3d-headers/Config.in
index c4efab673f..43916bb25b 100644
--- a/package/mesa3d-headers/Config.in
+++ b/package/mesa3d-headers/Config.in
@@ -7,3 +7,10 @@ config BR2_PACKAGE_MESA3D_HEADERS
 	  This package only installs headers needed by other packages.
 
 	  http://mesa3d.org
+
+if BR2_PACKAGE_MESA3D_HEADERS
+
+config BR2_PACKAGE_PROVIDES_LIBGL_HEADERS
+	default "mesa3d-headers"
+
+endif
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c1686aa6fd..14ce9cbfc0 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -18,6 +18,7 @@ MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.html
+MESA3D_HEADERS_PROVIDES = libgl-headers
 
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
-- 
2.26.2


-- 
CONFIDENTIALITY NOTICE
------------------------------------
This
 E-mail is 
intended only to be read or used by the addressee.The 
information 
contained in this E-mail message may be confidential 
information. If you 
are not the intended recipient, any use, 
interference with, distribution, 
disclosure or copying of this material 
is unauthorized and prohibited. 
Confidentiality attached to this 
communication is not waived or lost by 
reason of the mistaken delivery 
to you.
If you have received this message 
in error, please delete
 it and notify us by return E-mail or telephone 
NOVOMATIC Technologies 
Poland S.A. +48 12 258 00 50. Any E-mail attachment 
may contain software
 viruses which could damage your own computer system. 
Whilst reasonable 
precaution has been taken to minimize this risk, we 
cannot accept 
liability for any damage which you sustain as a result of 
software 
viruses. You should therefore carry out your own virus checks 
before 
opening any attachments.
------------------------------------

NOVOMATIC Technologies Poland S.A., Poland, Krakowska 368, 32-080 Zabierz?w
