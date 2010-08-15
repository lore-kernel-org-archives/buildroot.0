From: Massimiliano Marretta <max@marretta.com>
Date: Sun, 15 Aug 2010 19:01:12 +0200
Subject: [Buildroot] patch for hal
Message-ID: <4C681D58.7090501@marretta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  To resolve the hal build problem:

/bits/fcntl2.h: In function 'lock_hal_mtab':
/srv/source/i686-generic-linux-gnu/lib/gcc/i686-generic-linux-gnu/4.4.3/../../../../i686-generic-linux-gnu/include/bits/fcntl2.h:51: error: call to '__open_missing_mode' declared with attribute error: open with O_CREAT in second argument needs 3 arguments

I create this pacth:


diff -crBN hal-0.5.8_old/tools/hal-storage-shared.c 
hal-0.5.8/tools/hal-storage-shared.c
*** hal-0.5.8_old/tools/hal-storage-shared.c    Mon Sep 11 23:56:40 2006
--- hal-0.5.8/tools/hal-storage-shared.c    Sun Aug 15 16:26:42 2010
***************
*** 560,566 ****

       printf ("%d: XYA attempting to get lock on 
/media/.hal-mtab-lock\n", getpid ());

!     lock_mtab_fd = open ("/media/.hal-mtab-lock", O_CREAT | O_RDWR);

       if (lock_mtab_fd < 0)
           return FALSE;
--- 560,566 ----

       printf ("%d: XYA attempting to get lock on 
/media/.hal-mtab-lock\n", getpid ());

!     lock_mtab_fd = open ("/media/.hal-mtab-lock", O_CREAT | O_RDWR, 600);

       if (lock_mtab_fd < 0)
           return FALSE;
<cid:part1.08070505.01090808@marretta.com>

-- 

Massimiliano Marretta
Via Zuccola 11
41015 Nonantola (Mo) - Italy
tel: +39 347 5340305
skype: mmarretta
/mailto:max at marretta.com/
/web:www.marretta.com/ <http://www.marretta.com>
