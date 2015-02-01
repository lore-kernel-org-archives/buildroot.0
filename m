From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:17:55 +0100
Subject: [Buildroot] [git commit] package/rpm: use 'none' for location path
Message-ID: <20150201221811.46E297FEAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eabd74ae510ffc282cbe4ae05676460daa64db9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recognized keywords are:
(location path: "external:internal:none")

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/rpm.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fda10f2..42a3b64 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -34,14 +34,14 @@ ifeq ($(BR2_PACKAGE_PCRE),y)
 RPM_DEPENDENCIES += pcre
 RPM_CONF_OPTS += --with-pcre=external
 else
-RPM_CONF_OPTS += --with-pcre=no
+RPM_CONF_OPTS += --with-pcre=none
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 RPM_DEPENDENCIES += file
 RPM_CONF_OPTS += --with-file=external
 else
-RPM_CONF_OPTS += --with-file=no
+RPM_CONF_OPTS += --with-file=none
 endif
 
 # xz payload support needs a toolchain w/ C++
