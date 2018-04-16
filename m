From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:39 -0300
Subject: [Buildroot] [PATCH 21/26] tinyhttpd: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-22-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/tinyhttpd/S85tinyhttpd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tinyhttpd/S85tinyhttpd b/package/tinyhttpd/S85tinyhttpd
index fb512a0375..f3f1de69bf 100755
--- a/package/tinyhttpd/S85tinyhttpd
+++ b/package/tinyhttpd/S85tinyhttpd
@@ -3,7 +3,6 @@
 PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 NAME=tinyhttpd
 
-test -x /usr/sbin/$NAME || exit 0
 mkdir -p /var/www
 
 case "$1" in
-- 
2.14.3
