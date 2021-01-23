From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 11:31:54 +0100
Subject: [Buildroot] [PATCH 5/6] package/mrouted: for merged usr,
 install to /usr by default, not /
In-Reply-To: <20210123103155.2599311-1-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
Message-ID: <20210123103155.2599311-6-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Config in /etc
- State files in /var
- Binaries in /usr

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/mrouted.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 9f52d1ca90..558efa946e 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -10,7 +10,8 @@ MROUTED_SITE = \
 MROUTED_DEPENDENCIES = host-bison
 MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
-MROUTED_CONFIGURE_OPTS = --enable-rsrr
+MROUTED_CONF_OPTS = --prefix=/usr --sysconfdir=/etc --localstatedir=/var
+MROUTED_CONF_OPTS += --enable-rsrr
 MROUTED_CPE_ID_VENDOR = troglobit
 
 define MROUTED_INSTALL_INIT_SYSV
-- 
2.25.1
