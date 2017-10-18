From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:23:56 +0200
Subject: [Buildroot] [git commit] shared-mime-info: need autoreconf
Message-ID: <20171018202015.91E607FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=565c6533ea8f124741a59311ed704653b73fb8fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-Remove-incorrect-dependency-from-install-data-hook.patch is
patching Makefile.am, so we need to autoreconf. If we don't do this,
we get build failures such as:

configure.ac:3: error: version mismatch.  This is Automake 1.15.1,
configure.ac:3: but the definition used by this AM_INIT_AUTOMAKE
configure.ac:3: comes from Automake 1.15.  You should recreate
configure.ac:3: aclocal.m4 with aclocal and run automake again.
WARNING: 'automake-1.15' is probably too old.
         You should only need it if you modified 'Makefile.am' or
         'configure.ac' or m4 files included by 'configure.ac'.

Fixes:

  http://autobuild.buildroot.net/results/440c9edd34d56d9207b9f1ee326a14a1c757b27d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shared-mime-info/shared-mime-info.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index b31f0aa..e68d631 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -8,6 +8,8 @@ SHARED_MIME_INFO_VERSION = 1.8
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
 SHARED_MIME_INFO_SITE = https://people.freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
+# 0001-Remove-incorrect-dependency-from-install-data-hook.patch
+SHARED_MIME_INFO_AUTORECONF = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-shared-mime-info libxml2 libglib2
 SHARED_MIME_INFO_CONF_OPTS = \
