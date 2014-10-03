From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 22:08:56 +0200
Subject: [Buildroot] [git commit] package/xenomai: enable or disable debug
	based on BR2_ENABLE_DEBUG
Message-ID: <20141003200913.56C759D5B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f018f897a117cccefd465e25ef4b98510e451291
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f360c2a..4bc0871 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -19,7 +19,8 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
+XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install \
+	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
