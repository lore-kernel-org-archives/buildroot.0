From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 00:00:39 +0200
Subject: [Buildroot] [PATCH 5/6 v3] package/parted: gettextize to match the
	new gettext version
In-Reply-To: <cover.1405547907.git.yann.morin.1998@free.fr>
References: <cover.1405547907.git.yann.morin.1998@free.fr>
Message-ID: <44d887887457165b744a21a59844c1f9be50088a.1405547907.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gettext macros in the package are from a gettext version older than
the one we have in Buildroot, so autoreconf fails.

Run gettextize prior to running autoreconf, like we do in wget.

Fixes:
    http://autobuild.buildroot.net/results/ee2/ee20455ead785200847f50e463c32c55821f8925/
    http://autobuild.buildroot.net/results/3fe/3fe46e1a6ef10645e46a2e9efdf651f60f05dea8/
    http://autobuild.buildroot.net/results/ecd/ecdacafb3245afa1cce4f587eff9bdfe5c162f81/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/parted/parted.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index fd82684..75537a7 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -11,6 +11,7 @@ PARTED_DEPENDENCIES = util-linux
 PARTED_INSTALL_STAGING = YES
 # For uclinux patch
 PARTED_AUTORECONF = YES
+PARTED_GETTEXTIZE = YES
 PARTED_LICENSE = GPLv3+
 PARTED_LICENSE_FILES = COPYING
 
-- 
1.9.1
