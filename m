From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:25 +0200
Subject: [Buildroot] [PATCH v3 20/37] package/efl: add systemd dependency
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-21-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n491

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: new patch
---
 package/efl/efl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 5073c48..038958e 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -50,6 +50,13 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 EFL_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+EFL_CONF_OPTS += --enable-systemd
+EFL_DEPENDENCIES += systemd
+else
+EFL_CONF_OPTS += --disable-systemd
+endif
+
 # If fontconfig is disabled, this is going to make general font
 # searching not work, and only some very direct 'load /path/file.ttf'
 # will work alongside some old-school ttf file path searching. This
-- 
2.4.3
