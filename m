From: Uwe Fechner <uwe.fechner@nl.abb.com>
Date: Tue, 4 May 2021 11:18:59 +0000
Subject: [Buildroot] sudo: error while loading shared libraries
Message-ID: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

we are using buildroot on i.mx6 since a long time.

Since yesterday I get the following error with the sudo package:

sudo dmesg
sudo: error while loading shared libraries: libsudo_util.so.0: cannot open shared object file: No such file or directory

We are using sudo-1.9.5p2 .

The library exists and the permissions seem to be correct:


ls -la /usr/libexec/sudo
total 588
drwxr-xr-x  2 root root   4096 May  3 19:31 .
drwxr-xr-x 11 root root   4096 May  3 19:31 ..
-rw-r--r--  1 root root  17716 May  3 19:31 audit_json.so
-rw-r--r--  1 root root   9380 May  3 19:31 group_file.so
lrwxrwxrwx  1 root root     21 May  3 19:31 libsudo_util.so -> libsudo_util.so.0.0.0
lrwxrwxrwx  1 root root     21 May  3 19:31 libsudo_util.so.0 -> libsudo_util.so.0.0.0
-rwxr-xr-x  1 root root 112412 May  3 19:31 libsudo_util.so.0.0.0
-rw-r--r--  1 root root   5284 May  3 19:31 sample_approval.so
-rw-r--r--  1 root root 420184 May  3 19:31 sudoers.so
-rw-r--r--  1 root root   5260 May  3 19:31 sudo_noexec.so
-rw-r--r--  1 root root   5276 May  3 19:31 system_group.so

Any idea?

Uwe Fechner
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210504/36d12c1e/attachment.html>
