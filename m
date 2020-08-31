From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 20:38:59 +0200
Subject: [Buildroot] [git commit] package/avahi: disable introspection
Message-ID: <20200831183131.AA7F787530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4fcf2ff58e712b168fea549748ab2bb9ed7b88d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba/

Building with introspection (together with D-Bus) support currently fails.
Fixing it is not trivial, so explicitly disable introspection for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 73db37545f..eef05f0d2f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -35,6 +35,7 @@ AVAHI_CONF_OPTS = \
 	--disable-mono \
 	--disable-monodoc \
 	--disable-stack-protector \
+	--disable-introspection \
 	--with-distro=none \
 	--disable-manpages \
 	$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
