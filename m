From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 13:56:32 +0200
Subject: [Buildroot] [git commit] package/lensfun: fix static only build
Message-ID: <20170401115641.A24D082563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1efe5a151a9dbaf784ed805f0e3973c903195b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build lensfun.a for static only build.

Fixes:
http://autobuild.buildroot.net/results/63e/63e7700a242c7c28ede0fe0b6a63db288e73e974/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lensfun/lensfun.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 8e92e59..fa002c7 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -34,6 +34,12 @@ else
 LENSFUN_CONF_OPTS += -DBUILD_LENSTOOL=OFF
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LENSFUN_CONF_OPTS += -DBUILD_STATIC=ON
+else
+LENSFUN_CONF_OPTS += -DBUILD_STATIC=OFF
+endif
+
 # Don't install helper scripts (which require python3 and gksudo).
 # Don't run setup.py on the host.
 LENSFUN_CONF_OPTS += -DINSTALL_HELPER_SCRIPTS=OFF -DPYTHON=OFF
