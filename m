From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:15 +0100
Subject: [Buildroot] [PATCH 37/38] libsoup: remove --without-html-dir
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <986b4bfa66b8f6bdda950caffce16b273bd751cf.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--without-html-dir doesn't work. It leads libsoup ./configure script
to think that HTML_DIR is "no", which leads to the installation of the
documentation in $(STAGING_DIR)no (yes, with the "no" suffix at the
end). The issue is that --with-html-dir is not an enable/disable type
of option, it's an option that only allows to pass a PATH for
documentation installation.

As we don't want the documentation to be installed in this odd
$(STAGING_DIR)no directory, we simply get rid of this option.

See 7e62e8ec723f91e07bb4ac9ae3e55b65e3123082 for another instance of
the same problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/libsoup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 3e9edd3..3829a81 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -24,7 +24,7 @@ LIBSOUP_CONF_OPT = \
 	--disable-explicit-deps \
 	--disable-glibtest	\
 	--without-gnome		\
-	--disable-gtk-doc --without-html-dir
+	--disable-gtk-doc
 
 LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2
 
-- 
1.6.3.3
