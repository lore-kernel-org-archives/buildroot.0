From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Nov 2013 10:41:19 +0100
Subject: [Buildroot] [git commit] mongoose: S85mongoose: fix default options
Message-ID: <20131125094406.6D2409BB58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12da132c2bc6e980abe22ea4d4edfd1792dd5845
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mongoose fails to start because the options used are not supported by
mongoose. Fix it by using the correct option names instead.

[Peter: reworded commit text and use the correct long options instead]
Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/S85mongoose |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
index e9e8524..ff7da05 100755
--- a/package/mongoose/S85mongoose
+++ b/package/mongoose/S85mongoose
@@ -10,7 +10,7 @@ NAME=mongoose
 DESC="Mongoose HTTP server"
 
 DAEMON=`which mongoose`
-OPTIONS="-max_threads 3 -root /var/www  -ports 80"
+OPTIONS="-num_threads 3 -document_root /var/www -listening_ports 80"
 
 [ -e /etc/default/mongoose ] && . /etc/default/mongoose
 
