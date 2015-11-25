From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:00:06 +0100
Subject: [Buildroot] [git commit] c-ares: define random file
Message-ID: <20151125222250.5C33181EFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf44dfedc6cec76c245d9de6545a4349b7747bd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When cross-compiling it assumes there's none, however that's not true.
Specify the usual /dev/urandom for this usage, it's used for random key
generation on startup.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c858887..77ae4b9 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -7,6 +7,7 @@
 C_ARES_VERSION = 1.10.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
+C_ARES_CONF_OPTS = --with-random=/dev/urandom
 # Rebuild configure to avoid XC_CHECK_USER_CFLAGS
 C_ARES_AUTORECONF = YES
 C_ARES_LICENSE = MIT
