From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 00:05:45 +0100
Subject: [Buildroot] [git commit] poppler: Install files into staging
Message-ID: <20141209230749.F16BE7FC87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed592d6e02275c4402f477693195d941a481e67d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install poppler's header files and libraries into staging, since it
provides a library that can be used by other packages.

[Thomas: slightly extended the commit message.]

Signed-off-by: Alan Ott <alan@signal11.us>
Suggested-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a52b079..a972325 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -10,6 +10,7 @@ POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
+POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
