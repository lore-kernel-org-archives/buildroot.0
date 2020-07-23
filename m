From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:07:59 -0700
Subject: [Buildroot] [PATCH 01/12] package/gcr: fix gpg path
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

gnugpg2 does not create /usr/bin/gpg2, instead, /usr/bin/gpg2 is typically
a symlink to /usr/bin/gpg.

Buildroot does not create this symlink, so this path is not valid.
Change the path to /usr/bin/gpg to fix this issue.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gcr/gcr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 97a0e22064..b4f0d582a5 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -15,7 +15,7 @@ GCR_DEPENDENCIES = \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
-GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
+GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg
 GCR_CONF_OPTS = \
 	--disable-gtk-doc \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
-- 
2.26.2
