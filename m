From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:23 +0100
Subject: [Buildroot] [PATCH 02/15] package/iwd: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-3-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for iwd and its configuration files is added by the
services/networkmanager module in the SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/iwd/iwd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index b1841b5476..b164970196 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -11,6 +11,7 @@ IWD_LICENSE = LGPL-2.1+
 IWD_LICENSE_FILES = COPYING
 # sources from git, no configure script provided
 IWD_AUTORECONF = YES
+IWD_SELINUX_MODULES = networkmanager
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-- 
2.25.4
