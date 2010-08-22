From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Aug 2010 10:13:49 +0000 (UTC)
Subject: [Buildroot] [Bug 2371] QT MYSQL Module does not build when MySQL
 installed on the host
In-Reply-To: <bug-2371-163@https.bugs.busybox.net/>
References: <bug-2371-163@https.bugs.busybox.net/>
Message-ID: <20100822101349.492B383294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2371

--- Comment #8 from Paul Jones <paul@pauljones.id.au>  ---
Sorry for the delay.

Distro is Gentoo on x86_64 with mysql server + client installed.
Buildroot is latest git, using both internal or external crosstool-ng uClibc
toolchain (one at a time though...)
Problem occurs with QTe version 4.6.2 and 4.6.3

This is the output from config.tests/mysql

peejay at desktop
/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.3/config.tests/unix/mysql
$ make -n
echo compiling mysql.cpp &&
/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
--sysroot=/media/dev/buildroot-arm/output/staging -c -pipe -O2 -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/media/dev/buildroot-arm/output/staging/usr/include
-I/media/dev/buildroot-arm/output/staging/include -O2 -Wall -W 
-I../../../mkspecs/qws/linux-arm-g++ -I. -I/usr/include/mysql
-I/media/dev/buildroot-arm/output/staging/usr/include/mysql -o mysql.o
mysql.cpp
echo linking mysql &&
/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
--sysroot=/media/dev/buildroot-arm/output/staging
-L/media/dev/buildroot-arm/output/staging/lib
-L/media/dev/buildroot-arm/output/staging/usr/lib -Wl,-O1 -o mysql mysql.o    
-L/usr/lib64/mysql -lz -lcrypt -lnsl -lm -L/usr/lib64 -lssl -lcrypto
-L/media/dev/buildroot-arm/output/staging/usr/lib/mysql -lmysqlclient 
peejay at desktop
/media/dev/buildroot-arm/output/build/qt-everywhere-opensource-src-4.6.3/config.tests/unix/mysql
$ make
compiling mysql.cpp
linking mysql
/usr/lib64/mysql/libmysqlclient.so: file not recognized: File format not
recognized
collect2: ld returned 1 exit status
make: *** [mysql] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
