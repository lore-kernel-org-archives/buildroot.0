From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 22 Jun 2021 15:41:20 +0300
Subject: [Buildroot] [PATCH 1/2] package/postgresql: add cflags_sl option to
 pg_config
In-Reply-To: <20210622124121.999281-1-fido_max@inbox.ru>
References: <20210622124121.999281-1-fido_max@inbox.ru>
Message-ID: <20210622124121.999281-2-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some external packages call pg_config to determine the installed
PostgreSQL cflags_sl option. Add this output to Buildroots own
pg_config, so these packages correctly compile.

Default value is defined at src/template/linux as:

Extra CFLAGS for code that will go into a shared library
CFLAGS_SL="-fPIC"

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/pg_config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
index 3b0cb35f2c..099f1ee390 100644
--- a/package/postgresql/pg_config
+++ b/package/postgresql/pg_config
@@ -31,6 +31,10 @@ case "$1" in
   --cflags)
 	echo "@TARGET_CFLAGS@"
 	;;
+  --cflags_sl)
+	# defined at src/template/linux
+	echo "-fPIC"
+	;;
   --cc)
 	echo "@TARGET_CC@"
 	;;
-- 
2.31.1
