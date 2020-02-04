From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  4 Feb 2020 14:31:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/norm: switch to Github hosted
 archive
In-Reply-To: <20200204133157.10824-1-titouan.christophe@railnova.eu>
References: <20200204133157.10824-1-titouan.christophe@railnova.eu>
Message-ID: <20200204133157.10824-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original download server (downloads.pf.itd.nrl.navy.mil)
is quite unreliable, which lead to the download being very slow
or even failing. Since the project is now hosted on Github, we
switch to that site, which makes the download tractable.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/norm/norm.hash | 2 +-
 package/norm/norm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/norm/norm.hash b/package/norm/norm.hash
index b4fd8e171a..2eddb91ecb 100644
--- a/package/norm/norm.hash
+++ b/package/norm/norm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	4480a6ea53fb7ce45b4bc2061d18fbfd46ee9990fc2ed9a9dc303ce4d87888a6	src-norm-1.5.8.tgz
+sha256	4480a6ea53fb7ce45b4bc2061d18fbfd46ee9990fc2ed9a9dc303ce4d87888a6	src-norm-with-protolib-1.5.8.tgz
 sha256	ba4b7e49b0163d6839830e3f47505696c6eaac77ccd93531831dc837b2160608	LICENSE.TXT
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
-- 
2.24.1
