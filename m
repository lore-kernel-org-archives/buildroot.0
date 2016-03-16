From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 22:19:36 +0100
Subject: [Buildroot] [git commit] samba4: add host-python to dependencies
Message-ID: <20160316224555.14E6E7F8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74e0ba60f79e04d7147bd6d2a4a1797c605542ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though it's inherited by the python dependency it's more clear this
way for graph-depends, since it's used by the waf buildsystem.
And even though we have a hard dependency on python for the distro this
python could ostensibly be 3.x which isn't compatible with the bundled
waf series (1.5.x) in samba (as of current shipping version and upcoming
4.4.x series).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ee0452e..0fa70a5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -10,7 +10,9 @@ SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPLv3+
 SAMBA4_LICENSE_FILES = COPYING
-SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
+SAMBA4_DEPENDENCIES = \
+	host-e2fsprogs host-heimdal host-python \
+	e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline)
