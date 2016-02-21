From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:59:44 +0100
Subject: [Buildroot] [git commit] package/links: add optional support for gpm
Message-ID: <20160221140059.D36787FFD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c9490459e7138f1bc4ec2d3668cc7374ea4763e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index def7b75..62f91a3 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -56,6 +56,13 @@ else
 LINKS_CONF_OPTS += --without-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_GPM),y)
+LINKS_CONF_OPTS += --with-gpm
+LINKS_DEPENDENCIES += gpm
+else
+LINKS_CONF_OPTS += --without-gpm
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LINKS_CONF_OPTS += --with-libevent
 LINKS_DEPENDENCIES += libevent
