From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 17:43:51 +0100
Subject: [Buildroot] [git commit] package/norm: switch to Github hosted
 archive
Message-ID: <20200205163246.A202D8D32B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49c112e16cabc8eacaa74c2593e7a94834ace198
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original download server (downloads.pf.itd.nrl.navy.mil)
is quite unreliable, which lead to the download being very slow
or even failing. Since the project is now hosted on Github, we
switch to that site, which makes the download tractable.

Update the hash, and use the opportunity to realign fields to the new
spacing convention.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr: spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/norm/norm.hash | 4 ++--
 package/norm/norm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/norm/norm.hash b/package/norm/norm.hash
index b4fd8e171a..ab0930e8b5 100644
--- a/package/norm/norm.hash
+++ b/package/norm/norm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	4480a6ea53fb7ce45b4bc2061d18fbfd46ee9990fc2ed9a9dc303ce4d87888a6	src-norm-1.5.8.tgz
-sha256	ba4b7e49b0163d6839830e3f47505696c6eaac77ccd93531831dc837b2160608	LICENSE.TXT
+sha256  4480a6ea53fb7ce45b4bc2061d18fbfd46ee9990fc2ed9a9dc303ce4d87888a6  src-norm-with-protolib-1.5.8.tgz
+sha256  ba4b7e49b0163d6839830e3f47505696c6eaac77ccd93531831dc837b2160608  LICENSE.TXT
diff --git a/package/norm/norm.mk b/package/norm/norm.mk
index d5f7d0400b..2f9fc7b657 100644
--- a/package/norm/norm.mk
+++ b/package/norm/norm.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 NORM_VERSION = 1.5.8
-NORM_SITE = http://downloads.pf.itd.nrl.navy.mil/norm
-NORM_SOURCE = src-norm-$(NORM_VERSION).tgz
+NORM_SITE = https://github.com/USNavalResearchLaboratory/norm/releases/download/v$(NORM_VERSION)
+NORM_SOURCE = src-norm-with-protolib-$(NORM_VERSION).tgz
 NORM_INSTALL_STAGING = YES
 NORM_LICENSE = NRL License
 NORM_LICENSE_FILES = LICENSE.TXT
