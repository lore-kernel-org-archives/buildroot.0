From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 6 Sep 2012 06:28:40 -0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2012-09-05
Message-ID: <CADiAo4Ja=ddnGjLMrz_qjc344_rzk85AakU4Tc8UFM7hfqBK=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I spotted this:

Build 9dfa1389151ef369c7d0aea63c84f85eca45d402
==============================================

Status         : NOK
Failure reason : linux-pam-1.1.4
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-09-05 08:11:32
Git commit ID  :
http://git.buildroot.net/buildroot/commit/?id=5f566e5d917bcf6bb3b70a29856aa6013cb01b0c
End of log     :
http://autobuild.buildroot.net/results/9dfa1389151ef369c7d0aea63c84f85eca45d402/build-end.log
Complete log   :
http://autobuild.buildroot.net/results/9dfa1389151ef369c7d0aea63c84f85eca45d402/build.log.bz2
Configuration  :
http://autobuild.buildroot.net/results/9dfa1389151ef369c7d0aea63c84f85eca45d402/config
Defconfig      :
http://autobuild.buildroot.net/results/9dfa1389151ef369c7d0aea63c84f85eca45d402/defconfig

And it failed here:

Making all in pam_userdb
make[4]: Entering directory
`/home/test/test/output/build/linux-pam-1.1.4/modules/pam_userdb'

[skip]

-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -W -Wall
-Wbad-function-cast -Wcast-align -Wcast-qual -Wmissing-declarations
-Wmissing-prototypes -Wpointer-arith -Wreturn-type -Wstrict-prototypes
-Wwrite-strings -Winline -Wshadow -no-undefined -avoid-version -module
-L../../libpam -lpam -ldb -lcrypt
-Wl,--version-script=./../modules.map -Wl,--as-needed
-Wl,--no-undefined -Wl,-O1 -o pam_userdb.la -rpath /lib/security
pam_userdb.lo  -lintl
libtool: link: /home/test/test/output/host/usr/bin/x86_64-linux-gcc
-shared  .libs/pam_userdb.o   -Wl,-rpath
-Wl,/home/test/test/output/build/linux-pam-1.1.4/libpam/.libs
-L/home/test/test/output/build/linux-pam-1.1.4/libpam
/home/test/test/output/build/linux-pam-1.1.4/libpam/.libs/libpam.so
-ldl -ldb -lcrypt -lintl  -Wl,--version-script=./../modules.map
-Wl,--as-needed -Wl,--no-undefined -Wl,-O1   -Wl,-soname
-Wl,pam_userdb.so -o .libs/pam_userdb.so
.libs/pam_userdb.o: In function `user_lookup':
pam_userdb.c:(.text+0x200): undefined reference to `__db_ndbm_open'
pam_userdb.c:(.text+0x254): undefined reference to `__db_ndbm_firstkey'
pam_userdb.c:(.text+0x267): undefined reference to `__db_ndbm_fetch'
pam_userdb.c:(.text+0x2aa): undefined reference to `__db_ndbm_nextkey'
pam_userdb.c:(.text+0x369): undefined reference to `__db_ndbm_fetch'
pam_userdb.c:(.text+0x516): undefined reference to `__db_ndbm_close'
pam_userdb.c:(.text+0x54f): undefined reference to `__db_ndbm_close'
pam_userdb.c:(.text+0x564): undefined reference to `__db_ndbm_firstkey'
pam_userdb.c:(.text+0x606): undefined reference to `__db_ndbm_close'
pam_userdb.c:(.text+0x618): undefined reference to `__db_ndbm_nextkey'
pam_userdb.c:(.text+0x646): undefined reference to `__db_ndbm_close'
collect2: ld returned 1 exit status

Since I submitted linux-pam I'll look into this. Few questions though:

1. Anything special about ndbm under x86-64? Is it part of uclibc
which was not included in config at random?
2. Is there a way to query autobuilder results for specific
architecture and particular package that was built? In case I want to
see any runs where linux-pam was or was not included in config?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
