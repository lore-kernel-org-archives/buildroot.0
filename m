From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2020 11:18:55 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/sysklogd: use
 --exec-prefix to install binaries to /sbin
Message-ID: <20200316100651.9C64181E02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acec20bd8e61f32318e455e31face9752b927466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

To match the initscript and service file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 266c171170..55ff71d484 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -10,6 +10,8 @@ SYSKLOGD_LICENSE = GPL-2.0+
 SYSKLOGD_LICENSE_FILES = COPYING
 # From git
 SYSKLOGD_AUTORECONF = YES
+# install binaries to /sbin
+SYSKLOGD_CONF_OPTS = --exec-prefix=/
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
