From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 31 Jul 2020 23:53:45 +0200
Subject: [Buildroot] [PATCH 5/5] package/systemd: disable portabled
In-Reply-To: <20200731215345.19212-1-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
Message-ID: <20200731215345.19212-6-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

portabled is a container-like service, but so far its
still a preview and basically unknown as the portablectl
is hidden in /usr/lib/systemd.

Disable it for now.

See https://systemd.io/PORTABLE_SERVICES/

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ac03e16829..0e95a2d36b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -45,7 +45,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dtelinit-path=/sbin/telinit \
 	-Didn=true \
-	-Dnss-systemd=true
+	-Dnss-systemd=true \
+	-Dportabled=false
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
-- 
2.27.0
