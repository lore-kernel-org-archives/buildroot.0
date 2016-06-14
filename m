From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:15 +0200
Subject: [Buildroot] [PATCH 07/12] reproducibility/libgpg-error: override
	timestamps
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-7-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with SOURCE_DATE_EPOCH

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/libgpg-error/libgpg-error.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 52b7058..de232eb 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -14,4 +14,8 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_AUTORECONF = YES
 LIBGPG_ERROR_GETTEXTIZE = YES
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+LIBGPG_ERROR_MAKE_OPTS = BUILD_TIMESTAMP=$(SOURCE_DATE)
+endif
+
 $(eval $(autotools-package))
-- 
2.8.2
