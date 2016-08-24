From: Stanislav Vlasic <svlasic@gmail.com>
Date: Wed, 24 Aug 2016 13:02:07 +0200
Subject: [Buildroot] [BUG] eglibc and Kodi Krypton
Message-ID: <npjure$ucu$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Kodi Krypton causes random crashes when using eglibc (2.18 or 2.19, 
doesnt matter - from 2016.05).

GDB output:
(gdb) kodi.bin: pthread_mutex_lock.c:347: __pthread_mutex_lock_full: 
Assertion `(-(e)) != 35 || (kind != PTHREAD_MUTEX_ERRORCHECK_NP && kind 
!= PTHREAD_MUTEX_RECURSIVE_NP)' failed.

I rebuilt with glibc 2.23 which fixed issue. Platform is aarch64, custom 
3.14 kernel (Amlogic), not sure if same happens with armel and armhf 
(did not test it).

Regards,
Stane1983
