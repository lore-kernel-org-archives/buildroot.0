From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 15:59:07 +0000
Subject: [Buildroot] [PATCH 3/3] pinentry: remove non-existent configure
	options for Qt3 and GTK+1
In-Reply-To: <1418399947-12517-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418399947-12517-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1418399947-12517-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt3 and GTK+1 support were removed by this commit:
  http://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=f2ed42297528f2a126d189c6181d3105ceecca22

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
1.7.1
