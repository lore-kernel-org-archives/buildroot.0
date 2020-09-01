From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 21:39:56 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/avahi: disable
 introspection
Message-ID: <20200901193237.92ED77FD66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aa8b416424794db0f8fdd72e32f8e3d9bbc9805
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba/

Building with introspection (together with D-Bus) support currently fails.
Fixing it is not trivial, so explicitly disable introspection for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b4fcf2ff58e712b168fea549748ab2bb9ed7b88d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 53021f6b6d..8d451c1791 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -81,6 +81,7 @@ AVAHI_CONF_OPTS = \
 	--disable-mono \
 	--disable-monodoc \
 	--disable-stack-protector \
+	--disable-introspection \
 	--with-distro=none \
 	--disable-manpages \
 	$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
