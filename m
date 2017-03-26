From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Mar 2017 18:28:52 +0200
Subject: [Buildroot] [PATCH 4/5] package/mesa3d: explicitely disable asm
In-Reply-To: <20170326162853.3022-1-romain.naour@gmail.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
Message-ID: <20170326162853.3022-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

assembly are enabled by default on supported plaforms even while
crosscompiling if host == target:

checking whether to enable assembly... yes, x86_64

It was also disabled in the mesa package in Fedora since 7.6 [1].

[1] http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/commit/?id=629c8726

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f6a7151..1c83ad2 100644
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
-- 
2.9.3
