From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:33:32 +0100
Subject: [Buildroot] [git commit] package/openssh: use
 BR2_SYSTEM_DEFAULT_PATH as default PATH
Message-ID: <20181231132916.5D27481522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d63fb82509d9be26995d3a9a4fa56511250070fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use the configuration option $(BR2_SYSTEM_DEFAULT_PATH) to set the
default PATH in OpenSSH sessions.

$(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
quoted, which is exactly what we want.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 07f3e0d663..4ee7727fb9 100644
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
