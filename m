From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Mar 2019 18:32:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/czmq: use --without-docs
In-Reply-To: <20190311173258.2334-1-fontaine.fabrice@gmail.com>
References: <20190311173258.2334-1-fontaine.fabrice@gmail.com>
Message-ID: <20190311173258.2334-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --without-docs option instead of setting
ac_cv_prog_czmq_have_asciidoc=no

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/czmq/czmq.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index e6445be42e..1c9493cb76 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -12,10 +12,6 @@ CZMQ_DEPENDENCIES = zeromq host-pkgconf
 CZMQ_LICENSE = MPL-2.0
 CZMQ_LICENSE_FILES = LICENSE
 
-# asciidoc is a python script that imports unicodedata, which is not in
-# host-python, so disable asciidoc entirely.
-CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
-
-CZMQ_CONF_OPTS = --disable-Werror
+CZMQ_CONF_OPTS = --disable-Werror --without-docs
 
 $(eval $(autotools-package))
-- 
2.14.1
