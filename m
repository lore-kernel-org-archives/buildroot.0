From: =?UTF-8?B?IlBldHIgXCJRYXhpXCIgS2zDrW1hIg==?= <qaxi@seznam.cz>
Date: Thu, 02 Aug 2007 13:33:45 +0200
Subject: [Buildroot] SUDO package is outdated ...
Message-ID: <46B1C119.40401@seznam.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

(my first post, so sorry ... for all )


During compilation I received:

cp -af 
/home/klima/prg/myos/rootfs-buildroot/build_i586/libxml2-2.6.29/include/libxml 
/home/klima/prg/myos/rootfs-buildroot/build_i586/staging_dir/usr/include/libxml2
wget --passive-ftp  -P /home/klima/prg/myos/rootfs-buildroot/dl 
http://www.courtesan.com/sudo/dist/sudo-1.6.8p12.tar.gz
--13:26:06--  http://www.courtesan.com/sudo/dist/sudo-1.6.8p12.tar.gz
           => 
`/home/klima/prg/myos/rootfs-buildroot/dl/sudo-1.6.8p12.tar.gz'
Resolving www.courtesan.com... 72.36.231.42
Connecting to www.courtesan.com|72.36.231.42|:80... connected.
HTTP po?adavek odesl?n, program ?ek? na odpov?? ... 404 Not Found
13:26:06 CHYBA 404: Not Found.

And

it Was true:

$ lftp http://www.courtesan.com/sudo/dist/
cd ok, cwd=/sudo/dist                                    
lftp www.courtesan.com:/sudo/dist> ls
drwxr-xr-x            -  2006-02-23 11:13  ..
-rw-r--r--           1k  2007-07-30 09:48  MD5
-rw-r--r--           1k  2007-07-30 09:48  MD5.sig
drwxr-xr-x            -  2007-07-29 18:49  OLD
-rw-r--r--           2k  2002-10-02 19:29  PGPKEYS
-rw-r--r--           1k  2007-07-16 22:58  README
-rw-r--r--           1k  2007-07-30 09:48  SHA1
-rw-r--r--           1k  2007-07-30 09:48  SHA1.sig
drwxr-xr-x            -  2007-07-29 18:49  beta
drwxr-xr-x            -  1999-02-22 15:18  misc
-rw-r--r--           3k  2007-07-30 09:47  sudo-1.6.9p2.patch.gz
-rw-r--r--           1k  2007-07-30 09:48  sudo-1.6.9p2.patch.gz.sig
-rw-r--r--         545k  2007-07-30 09:46  sudo-1.6.9p2.tar.gz
-rw-r--r--           1k  2007-07-30 09:46  sudo-1.6.9p2.tar.gz.sig
-rw-r--r--         545k  2007-07-30 09:46  sudo.tar.gz
-rw-r--r--           1k  2007-07-30 09:46  sudo.tar.gz.sig


What is better solution?
1) patch package/sudo/sudo.mk
    to
    SUDO_VERSION:=1.6.9p2

2) patch package/sudo/sudo.mk
    to
    SUDO_VERSION:=""
    SUDO_SOURCE:=sudo$(SUDO_VERSION).tar.gz             <<< removed "-"
    SUDO_DIR:=$(BUILD_DIR)/sudo$(SUDO_VERSION)      <<< removed "-"

3) find other repository with all history releases in one directory

thes second should by universal ... anyone can put there 
SUDO_VERSION:=-1.6.9p2

-- 

   Petr Kl?ma

   e-mail:  qaxi@seznam.cz              
