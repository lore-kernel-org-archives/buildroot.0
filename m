From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jan 2017 17:11:23 +0100
Subject: [Buildroot] [git commit] alsa-utils: disable manpages generation
	from reStructured text
Message-ID: <20170104161501.146CC8082D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a954b84b584302998c70960bcb3197192f8d6d7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The alsaucm man page rst source file is missing in the tarball. When rst2man
is detected on the host, build fails:

make[2]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.

Upstream added[1] the missing file to the tarball to fix this issue. But since
we don't need the manpage to begin with, just disable rst2man to shorten build
time by a few milliseconds.

[1] http://git.alsa-project.org/?p=alsa-utils.git;a=commitdiff;h=c6bdde171e1532f7b37333a5a746b6e662f12c53

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9113b8d..a72191e 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -23,6 +23,7 @@ ALSA_UTILS_CONF_ENV = \
 
 ALSA_UTILS_CONF_OPTS = \
 	--disable-xmlto \
+	--disable-rst2man \
 	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
