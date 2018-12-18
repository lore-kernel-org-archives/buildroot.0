From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 17 Dec 2018 16:51:15 -0800
Subject: [Buildroot] [PATCH 3/4] openssh: use BR2_SYSTEM_DEFAULT_PATH as
 default PATH
In-Reply-To: <20181218005116.17435-1-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
Message-ID: <20181218005116.17435-4-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use the configuration option BR2_SYSTEM_DEFAULT_PATH to set the
default PATH in OpenSSH sessions.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
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
