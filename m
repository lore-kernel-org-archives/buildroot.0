From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:58 +0200
Subject: [Buildroot] [git commit] tinyhttpd: don't test if the binary exists
 in the init script
Message-ID: <20180416053719.0FFCE88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c48924cfbbb9b45f819a68dde8098072ab97853e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
