From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 22 Dec 2019 22:54:00 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
 <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
Message-ID: <CAEyMn7bLLC07t6_xWS2Mxy0Bh_M-bUCZt2Jm7cGmJV_hpj-6Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> > Thanks. Could you check whether the tarballs that are now produced by
> > this are identical to the tarballs we already have on
> > sources.buildroot.org ?
>
> I checked this for the fis package and unfortunately this is not the
> case. Do you expect to have the same hashes?

this is how the archive from sources.buildroot.org looks:

tar tvf fis-2892.tar.gz
drwxr-xr-x peko/peko         0 2014-02-09 12:26 fis-2892/
-rw-r--r-- peko/peko      1699 2007-01-18 17:42 fis-2892/endswap.cc
-rwxr-xr-x peko/peko      4229 2006-12-13 22:30 fis-2892/disklog
-rwxr-xr-x peko/peko       532 2004-07-13 22:56 fis-2892/cvstotbz2
-rwxr-xr-x peko/peko       451 2004-04-19 14:04 fis-2892/overwrite
-rwxr-xr-x peko/peko       196 2007-03-17 01:24 fis-2892/write_dvd
-rw-r--r-- peko/peko     15659 2007-05-02 22:42 fis-2892/fis.c
-rw-r--r-- peko/peko      6507 2007-01-28 14:55 fis-2892/apexctl.cc
-rw-r--r-- peko/peko       348 2007-03-17 01:24 fis-2892/Makefile
-rw-r--r-- peko/peko      1858 2007-01-23 18:42 fis-2892/sercommhdr.cc
-rwxr-xr-x peko/peko       534 2004-07-13 22:56 fis-2892/cvstotgz
-rwxr-xr-x peko/peko      1021 2006-12-13 22:30 fis-2892/report_disklog
-rw-r--r-- peko/peko      9956 2007-03-25 01:14 fis-2892/fis.cc
-rwxr-xr-x peko/peko       372 2004-01-25 16:04 fis-2892/cvsmv
-rwxr-xr-x peko/peko       402 2005-10-31 19:17 fis-2892/svntotbz2

and this is the generated on;

tar tvf fis-2892.tar.gz
-rw-r--r-- 0/0             348 2019-12-22 00:00 fis-2892/Makefile
-rw-r--r-- 0/0            6507 2019-12-22 00:00 fis-2892/apexctl.cc
-rwxr-xr-x 0/0             372 2019-12-22 00:00 fis-2892/cvsmv
-rwxr-xr-x 0/0             532 2019-12-22 00:00 fis-2892/cvstotbz2
-rwxr-xr-x 0/0             534 2019-12-22 00:00 fis-2892/cvstotgz
-rwxr-xr-x 0/0            4229 2019-12-22 00:00 fis-2892/disklog
-rw-r--r-- 0/0            1699 2019-12-22 00:00 fis-2892/endswap.cc
-rw-r--r-- 0/0           15659 2019-12-22 00:00 fis-2892/fis.c
-rw-r--r-- 0/0            9956 2019-12-22 00:00 fis-2892/fis.cc
-rwxr-xr-x 0/0             451 2019-12-22 00:00 fis-2892/overwrite
-rwxr-xr-x 0/0            1021 2019-12-22 00:00 fis-2892/report_disklog
-rw-r--r-- 0/0            1858 2019-12-22 00:00 fis-2892/sercommhdr.cc
-rwxr-xr-x 0/0             402 2019-12-22 00:00 fis-2892/svntotbz2
-rwxr-xr-x 0/0             196 2019-12-22 00:00 fis-2892/write_dvd

The diffrerences I see are:
- the s.b.o archive has an entry for the directory
- the s.b.o archive has the user/group owner peko while the generated has 0/0
- the file ordering is different

--
Heiko
