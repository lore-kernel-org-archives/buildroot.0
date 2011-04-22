From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Apr 2011 15:12:19 +0200
Subject: [Buildroot] [git commit] fs/skeleton: add ftp user/group
Message-ID: <20110422132109.91F8E82973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cffe3b1895f3b0b1e0cb36e1f209794a9ac9557b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by E.G. proftpd for the default (anonymous ftp) config.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/group             |    1 +
 fs/skeleton/etc/passwd            |    1 +
 fs/skeleton/etc/shadow            |    1 +
 fs/skeleton/home/{ => ftp}/.empty |    0
 4 files changed, 3 insertions(+), 0 deletions(-)
 rename fs/skeleton/home/{ => ftp}/.empty (100%)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index df12dba..311a455 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -12,6 +12,7 @@ staff:x:50:
 haldaemon:x:68:
 dbus:x:81:
 netdev:x:82:
+ftp:x:83
 nobody:x:99:
 nogroup:x:99:
 users:x:100:
diff --git a/fs/skeleton/etc/passwd b/fs/skeleton/etc/passwd
index 377d4df..ed7006a 100644
--- a/fs/skeleton/etc/passwd
+++ b/fs/skeleton/etc/passwd
@@ -10,6 +10,7 @@ backup:x:34:34:backup:/var/backups:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
 haldaemon:x:68:68:hald:/:/bin/sh
 dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
+ftp:x:83:83:ftp:/home/ftp:/bin/sh
 nobody:x:99:99:nobody:/home:/bin/sh
 sshd:x:103:99:Operator:/var:/bin/sh
 default:x:1000:1000:Default non-root user:/home/default:/bin/sh
diff --git a/fs/skeleton/etc/shadow b/fs/skeleton/etc/shadow
index 4941a1a..67b67c1 100644
--- a/fs/skeleton/etc/shadow
+++ b/fs/skeleton/etc/shadow
@@ -8,5 +8,6 @@ shutdown:*:10933:0:99999:7:::
 halt:*:10933:0:99999:7:::
 uucp:*:10933:0:99999:7:::
 operator:*:10933:0:99999:7:::
+ftp:*:10933:0:99999:7:::
 nobody:*:10933:0:99999:7:::
 default::10933:0:99999:7:::
diff --git a/fs/skeleton/home/.empty b/fs/skeleton/home/ftp/.empty
similarity index 100%
rename from fs/skeleton/home/.empty
rename to fs/skeleton/home/ftp/.empty
-- 
1.7.3.4
