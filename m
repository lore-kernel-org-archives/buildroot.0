From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:26:40 +0100
Subject: [Buildroot] [git commit] ipset: install libraries to staging
Message-ID: <20170301170423.7B92C7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c05b2f6b731ca802f6c7a6fc5fd39693793e48d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages may require libipset, for example keepalived.

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipset/ipset.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index db4952b..bb40fee 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -13,5 +13,6 @@ IPSET_CONF_OPTS = --with-kmod=no
 IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
+IPSET_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
