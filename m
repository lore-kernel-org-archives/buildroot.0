From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 12 Nov 2018 10:45:21 -0600
Subject: [Buildroot] [PATCH v2 2/2] package/proftpd: add sendfile
In-Reply-To: <20181112164521.27220-1-jared.bents@rockwellcollins.com>
References: <20181112164521.27220-1-jared.bents@rockwellcollins.com>
Message-ID: <20181112164521.27220-2-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables sendfile to ProFTPD for zero-copy transfers.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

--
[v1->v2]:
- Removed option and made sendfile always enabled.
---
 package/proftpd/proftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 324a602761..a228d58e03 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -20,6 +20,7 @@ PROFTPD_CONF_OPTS = \
 	--disable-ncurses \
 	--disable-facl \
 	--disable-dso \
+	--enable-sendfile \
 	--enable-shadow \
 	--with-gnu-ld
 
-- 
2.18.0
