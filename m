From: Vadim Malenboim <vadim@tangotec.com>
Date: Thu, 22 Nov 2012 11:01:26 +0200
Subject: [Buildroot] output/target isn't synced with the actual target
Message-ID: <CAJH6qSeGCdkP7rZL7iVxRoHXu6n0R-26K+kTqxH3MB6zVyUO3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I have libs in output/target/usr/lib but nothing on the actual target.
In addition no all libs that are present in output/target/lib are actually
present on the target.

On host :
-rwxr-xr-x 1 vadim tangotec  21224 Nov 22 09:45 ld-uClibc-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     23 Nov 22 09:42 ld-uClibc.so.0 ->
ld-uClibc-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   9456 Nov 22 09:45 libcrypt-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     22 Nov 22 09:42 libcrypt.so.0 ->
libcrypt-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     23 Nov 22 09:42 libc.so.0 ->
libuClibc-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   8384 Nov 22 09:45 libdl-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     19 Nov 22 09:42 libdl.so.0 ->
libdl-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     13 Nov 22 09:44 libgcc_s.so -> libgcc_s.so.1
-rw-r--r-- 1 vadim tangotec  49764 Nov 22 09:44 libgcc_s.so.1
-rwxr-xr-x 1 vadim tangotec  65708 Nov 22 09:45 libm-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     18 Nov 22 09:42 libm.so.0 ->
libm-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   1332 Nov 22 09:45 libnsl-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     20 Nov 22 09:42 libnsl.so.0 ->
libnsl-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec  62080 Nov 22 09:45 libpthread-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     24 Nov 22 09:42 libpthread.so.0 ->
libpthread-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   1340 Nov 22 09:45 libresolv-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     23 Nov 22 09:42 libresolv.so.0 ->
libresolv-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   8224 Nov 22 09:45 librt-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     19 Nov 22 09:42 librt.so.0 ->
librt-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   4380 Nov 22 09:45 libubacktrace-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     27 Nov 22 09:42 libubacktrace.so.0 ->
libubacktrace-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec 329184 Nov 22 09:45 libuClibc-0.9.34-git.so
-rwxr-xr-x 1 vadim tangotec   4656 Nov 22 09:45 libutil-0.9.34-git.so
lrwxrwxrwx 1 vadim tangotec     21 Nov 22 09:42 libutil.so.0 ->
libutil-0.9.34-git.so
[vadim at xn02 buildroot]$ cp output/target/usr/lib/libstdc++.so.6
/tftpboot/vadim/

On target :

-rwxr-xr-x    1 root     root         21224 Nov 22  2012
ld-uClibc-0.9.34-git.so
lrwxrwxrwx    1 root     root            23 Nov 22  2012 ld-uClibc.so.0 ->
ld-uClibc-0.9.34-git.so
lrwxrwxrwx    1 root     root            23 Nov 22  2012 libc.so.0 ->
libuClibc-0.9.34-git.so
-rwxr-xr-x    1 root     root          9456 Nov 22  2012
libcrypt-0.9.34-git.so
lrwxrwxrwx    1 root     root            22 Nov 22  2012 libcrypt.so.0 ->
libcrypt-0.9.34-git.so
-rwxr-xr-x    1 root     root          8384 Nov 22  2012 libdl-0.9.34-git.so
lrwxrwxrwx    1 root     root            19 Nov 22  2012 libdl.so.0 ->
libdl-0.9.34-git.so
lrwxrwxrwx    1 root     root            13 Nov 22  2012 libgcc_s.so ->
libgcc_s.so.1
-rw-r--r--    1 root     root         49764 Nov 22  2012 libgcc_s.so.1
-rwxr-xr-x    1 root     root         65708 Nov 22  2012 libm-0.9.34-git.so
lrwxrwxrwx    1 root     root            18 Nov 22  2012 libm.so.0 ->
libm-0.9.34-git.so
-rwxr-xr-x    1 root     root          1332 Nov 22  2012
libnsl-0.9.34-git.so
lrwxrwxrwx    1 root     root            20 Nov 22  2012 libnsl.so.0 ->
libnsl-0.9.34-git.so
-rwxr-xr-x    1 root     root         62080 Nov 22  2012
libpthread-0.9.34-git.so
lrwxrwxrwx    1 root     root            24 Nov 22  2012 libpthread.so.0 ->
libpthread-0.9.34-git.so
-rwxr-xr-x    1 root     root          1340 Nov 22  2012
libresolv-0.9.34-git.so
lrwxrwxrwx    1 root     root            23 Nov 22  2012 libresolv.so.0 ->
libresolv-0.9.34-git.so
-rwxr-xr-x    1 root     root          8224 Nov 22  2012 librt-0.9.34-git.so
lrwxrwxrwx    1 root     root            19 Nov 22  2012 librt.so.0 ->
librt-0.9.34-git.so
-rwxr-xr-x    1 root     root        293484 Nov 22  2012
libuClibc-0.9.34-git.so
-rwxr-xr-x    1 root     root          4656 Nov 22  2012
libutil-0.9.34-git.so
lrwxrwxrwx    1 root     root            21 Nov 22  2012 libutil.so.0 ->
libutil-0.9.34-git.so
# tftp -g -r /vadim/libstdc++.so.6 192.168.217.32


-- 
     * Vadim Malenboim.*
      Low Level Software Engineer.

      Cellular : +972(544)925862
      E-Mail   : vadim at tangotec.com
      WEB     : www.tangotec.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121122/026ea662/attachment-0001.html>
