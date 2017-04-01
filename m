From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:57:51 +0200
Subject: [Buildroot] [git commit] package/mesa3d: explicitely disable asm
Message-ID: <20170401135911.4232A822C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1512c2b7551f5b010efcb60372de068670ea1ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

assembly are enabled by default on supported plaforms even while
crosscompiling if host == target:

checking whether to enable assembly... yes, x86_64

It was also disabled in the mesa package in Fedora since 7.6 [1].

[1] http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/commit/?id=629c8726

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6fa1599..0dfa9a5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -22,6 +22,9 @@ MESA3D_DEPENDENCIES = \
 	expat \
 	libdrm
 
+# Disable assembly usage.
+MESA3D_CONF_OPTS = --disable-asm
+
 # The Sourcery MIPS toolchain has a special (non-upstream) feature to
 # have "compact exception handling", which unfortunately breaks with
 # mesa3d, so we disable it here by passing -mno-compact-eh.
