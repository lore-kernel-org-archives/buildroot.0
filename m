From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:31 +0100
Subject: [Buildroot] [PATCH 10/15] package/iputils: add SELinux module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-11-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for the iputils is added by the admin/netutils module in the
SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/iputils/iputils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4f8d9cb768..38e3cd03e8 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -16,6 +16,7 @@ IPUTILS_SITE = $(call github,iputils,iputils,s$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+IPUTILS_SELINUX_MODULES = netutils
 
 # Selectively build binaries
 IPUTILS_CONF_OPTS += \
-- 
2.25.4
