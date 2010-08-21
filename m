From: JNY <jny0@hotmail.com>
Date: Sat, 21 Aug 2010 01:21:29 -0700 (PDT)
Subject: [Buildroot] How to get gdb in the image
In-Reply-To: <20100820191257.61821f87@surf>
References: <29492552.post@talk.nabble.com> <20100820191257.61821f87@surf>
Message-ID: <29497355.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Since adding gdb to the menuconfig, buildroot no longer makes.  I get the
following errors and warnings:

getgroups.c: In function 'main':
getgroups.c:56: warning: attempt to free a non-heap object 'groups'
  TEST_LINK pwd_grp/ grcat
  TEST_LINK pwd_grp/ pwcat
  TEST_LINK pwd_grp/ test_grp
  TEST_LINK pthread/ ex1
  TEST_LINK pwd_grp/ test_pwd
  TEST_LINK pthread/ ex2
  TEST_LINK pthread/ ex3
  TEST_LINK pthread/ ex4
  TEST_LINK pthread/ ex5
  TEST_LINK pthread/ ex6
  TEST_LINK pthread/ ex7
  TEST_LINK pthread/ tst-too-many-cleanups
  TEST_LINK regex/ testregex
  TEST_LINK rpc/ getrpcent
  TEST_LINK regex/ testregexc
  TEST_LINK setjmp/ bug269-setjmp
  TEST_LINK regex/ testregexf
  TEST_LINK setjmp/ jmpbug
  TEST_LINK setjmp/ sigjmpbug
  TEST_LINK setjmp/ tst-setjmp
  TEST_LINK setjmp/ tst-vfork-longjmp
  TEST_LINK signal/ sigchld
  TEST_LINK regex/ testregexi
  TEST_LINK signal/ signal
  TEST_LINK signal/ tst-raise
  TEST_LINK signal/ tst-signal
  TEST_LINK signal/ tst-sigset
  TEST_LINK silly/ hello
  TEST_LINK regex/ testregexl
  TEST_LINK silly/ tiny
  TEST_LINK stat/ memcmp-stat
memcmp-stat.c: In function 'show_stat':
memcmp-stat.c:60: error: 'struct stat' has no member named 'st_atimensec'
memcmp-stat.c:62: error: 'struct stat' has no member named 'st_mtimensec'
memcmp-stat.c:64: error: 'struct stat' has no member named 'st_ctimensec'
make[2]: *** [memcmp-stat] Error 1
make[1]: *** [_dircompile_stat] Error 2
make[1]: *** Waiting for unfinished jobs....
  TEST_LINK regex/ testregexn
  TEST_LINK regex/ testregexp
  TEST_LINK regex/ testregexr
  TEST_LINK regex/ tst-regex2
In file included from
/home/JB/Apps/Buildroot2/buildroot-2010.02/output/staging/usr/include/bits/sigcontext.h:31,
                 from
/home/JB/Apps/Buildroot2/buildroot-2010.02/output/staging/usr/include/signal.h:333,
                 from ../test-skeleton.c:25,
                 from tst-regex2.c:244:
/home/JB/Apps/Buildroot2/buildroot-2010.02/output/staging/usr/include/asm/sigcontext.h:96:
warning: declaration does not declare anything
  TEST_LINK regex/ tst-regexloc
make[1]: Leaving directory
`/home/JB/Apps/Buildroot2/buildroot-2010.02/output/toolchain/uClibc-0.9.30.2/test'
make: ***
[/home/JB/Apps/Buildroot2/buildroot-2010.02/output/toolchain/uClibc-0.9.30.2/test/unistd/errno]
Error 2

Cheers,
JNY

-- 
View this message in context: http://old.nabble.com/How-to-get-gdb-in-the-image-tp29492552p29497355.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
