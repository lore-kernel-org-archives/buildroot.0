From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 14:29:30 +0200
Subject: [Buildroot] [git commit] package/tor: limit libseccomp support to
	archs supported by upstream
Message-ID: <20150426122937.DC88C81915@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbe7e621aa3190d97d10285a3d6f20e20420ef12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See this commit for a list of supported archs:
https://gitweb.torproject.org/tor.git/commit/src/common/sandbox.c?id=b0c1c700114aa8d4dfc180d85870c5bbe15fcacb

Fixes mips64el build error:
http://autobuild.buildroot.net/results/f97/f9792a0b013f6b79774ecc978d859f56bd941586/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 138a5b2..2c671ba 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -25,7 +25,7 @@ TOR_CONF_OPTS += \
 	--enable-static-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_i386)$(BR2_x86_64)$(BR2_PACKAGE_LIBSECCOMP),yy)
 TOR_CONF_OPTS += --enable-seccomp
 TOR_DEPENDENCIES += libseccomp
 else
