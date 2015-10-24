From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:57 +0200
Subject: [Buildroot] [PATCH v5 17/36] package/efl/libefl: add systemd
	dependency
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-18-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd it one of the "highly recommended" dependecies
according to the README [1] but disabling it doesn't need
the --enable-i-really-know-what-i-am-doing... option.
That's why systemd is not added to
BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.

[1] https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n491

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
    improve commit log
v3: new patch
---
 package/efl/libefl/libefl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 02c9005..c26c9c5 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -52,6 +52,13 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 LIBEFL_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+LIBEFL_CONF_OPTS += --enable-systemd
+LIBEFL_DEPENDENCIES += systemd
+else
+LIBEFL_CONF_OPTS += --disable-systemd
+endif
+
 # If fontconfig is disabled, this is going to make general font
 # searching not work, and only some very direct 'load /path/file.ttf'
 # will work alongside some old-school ttf file path searching. This
-- 
2.4.3
