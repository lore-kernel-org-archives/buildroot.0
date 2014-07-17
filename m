From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:50:09 +0200
Subject: [Buildroot] [git commit] package/parted: gettextize to match the
	new gettext version
Message-ID: <20140717075142.477559D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a8cc7ae3c5ef92565258b9e4ae387f196e4ada3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/parted/parted.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
