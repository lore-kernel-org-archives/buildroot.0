From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:49:13 +0100
Subject: [Buildroot] [git commit] pinentry: remove non-existent configure
	options for Qt3 and GTK+1
Message-ID: <20141221224918.E7703805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa36fc34612fcf221e3076fdcb4a39c83c0c397b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt3 and GTK+1 support were removed by this commit:
  http://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=f2ed42297528f2a126d189c6181d3105ceecca22

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pinentry/pinentry.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 56e8e71..f34cc0e 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -10,8 +10,6 @@ PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-PINENTRY_CONF_OPTS = --disable-pinentry-gtk # gtk1
-PINENTRY_CONF_OPTS += --disable-pinentry-qt  # qt3
 PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
 
 # build with X if available
