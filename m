From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:30 +0100
Subject: [Buildroot] [PATCH 09/15] package/fping: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-10-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for fping is added by the admin/netutils module in the SELinux
refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
