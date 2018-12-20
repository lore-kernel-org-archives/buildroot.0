From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 20 Dec 2018 09:58:13 -0800
Subject: [Buildroot] [PATCH v3 3/4] openssh: use BR2_SYSTEM_DEFAULT_PATH as
 default PATH
In-Reply-To: <20181220175814.2195-1-mmayer@broadcom.com>
References: <20181220175508.2091-1-mmayer@broadcom.com>
 <20181220175814.2195-1-mmayer@broadcom.com>
Message-ID: <20181220175814.2195-3-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use the configuration option $(BR2_SYSTEM_DEFAULT_PATH) to set the
default PATH in OpenSSH sessions.

$(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
quoted, which is exactly what we want.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 07f3e0d663f6..4ee7727fb9e8 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -11,6 +11,7 @@ OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
+	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
 	--disable-lastlog \
 	--disable-utmp \
 	--disable-utmpx \
-- 
2.17.1
