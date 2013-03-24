From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 16:15:47 +0100
Subject: [Buildroot] [git commit] gettext: do not get the libiconv
	dependency on the host
Message-ID: <20130324151610.1CFBC9B27F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dce7be4d7652506790464d71b05d2404bab2f705
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/e47a439c7dd763c6abc02f77730838036472e828/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/gettext.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 4757cf8..8dc701e 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -11,6 +11,7 @@ GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
 
 GETTEXT_CONF_OPT += \
 	--disable-libasprintf \
