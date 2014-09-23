From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 20:20:28 +0200
Subject: [Buildroot] [git commit] systemd: make libseccomp usage
	deterministic
Message-ID: <20140923182236.4A4B39D75C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6653f58a57db47d7028fd42ad401a88df3519871
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix minor typo in commit title.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 39b458e..c7cff0d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -76,6 +76,13 @@ else
 SYSTEMD_CONF_OPT += --disable-gudev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+SYSTEMD_CONF_OPT += --enable-seccomp
+SYSTEMD_DEPENDENCIES += libseccomp
+else
+SYSTEMD_CONF_OPT += --disable-seccomp
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += \
 	xz 		\
