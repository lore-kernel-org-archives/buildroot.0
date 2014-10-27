From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 19:23:00 +0100
Subject: [Buildroot] [git commit] system/skeleton: drop valid shell from
	non-login users
Message-ID: <20141027182313.87A0BB169A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0faad7429257c2f00e1249400238667c8c81483f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Non-login users shouldn't have a valid shell so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/passwd |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index dc78581..3a80341 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -1,10 +1,10 @@
 root:x:0:0:root:/root:/bin/sh
-daemon:x:1:1:daemon:/usr/sbin:/bin/sh
-bin:x:2:2:bin:/bin:/bin/sh
-sys:x:3:3:sys:/dev:/bin/sh
+daemon:x:1:1:daemon:/usr/sbin:/bin/false
+bin:x:2:2:bin:/bin:/bin/false
+sys:x:3:3:sys:/dev:/bin/false
 sync:x:4:100:sync:/bin:/bin/sync
-mail:x:8:8:mail:/var/spool/mail:/bin/sh
-www-data:x:33:33:www-data:/var/www:/bin/sh
-operator:x:37:37:Operator:/var:/bin/sh
-ftp:x:83:83:ftp:/home/ftp:/bin/sh
-nobody:x:99:99:nobody:/home:/bin/sh
+mail:x:8:8:mail:/var/spool/mail:/bin/false
+www-data:x:33:33:www-data:/var/www:/bin/false
+operator:x:37:37:Operator:/var:/bin/false
+ftp:x:83:83:ftp:/home/ftp:/bin/false
+nobody:x:99:99:nobody:/home:/bin/false
