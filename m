From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:08 +0100
Subject: [Buildroot] [git commit] package/fping: add SELinux module
Message-ID: <20201229134643.E42548383C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a38e6757be5cacacfa42cc3a21dbed2731cfc2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for fping is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fping/fping.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 24aca32367..0a03c1dfdc 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -8,5 +8,6 @@ FPING_VERSION = 5.0
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
+FPING_SELINUX_MODULES = netutils
 
 $(eval $(autotools-package))
