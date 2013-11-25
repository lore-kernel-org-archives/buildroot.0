From: Davide Viti <zinosat@tiscali.it>
Date: Mon, 25 Nov 2013 10:03:23 +0100
Subject: [Buildroot] [PATCH 1/1 v2] mongoose: startup script must use short
	options
Message-ID: <1385370203-7524-1-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Davide Viti <zinosat@tiscali.it>

mongoose fails to start because long options are not supported (as
shown by "mongoose -h")

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
 package/mongoose/S85mongoose | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
index e9e8524..ecf896a 100755
--- a/package/mongoose/S85mongoose
+++ b/package/mongoose/S85mongoose
@@ -10,7 +10,7 @@ NAME=mongoose
 DESC="Mongoose HTTP server"
 
 DAEMON=`which mongoose`
-OPTIONS="-max_threads 3 -root /var/www  -ports 80"
+OPTIONS="-t 3 -r /var/www -p 80"
 
 [ -e /etc/default/mongoose ] && . /etc/default/mongoose
 
-- 
1.8.1.2
