From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 08:43:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-27
In-Reply-To: <20140528063007.1778D101696@stock.ovh.net>
References: <20140528063007.1778D101696@stock.ovh.net>
Message-ID: <20140528064358.GB3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-28 08:30 +0200, Thomas Petazzoni spake thusly:
>        arm |                      exim-4.82 | NOK | http://autobuild.buildroot.net/results/0a392087878f80a70435981856455a30152b684d/

pthread problem on a static build:
    /home/test/test/1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libdb.a(mut_pthread.o):
    In function `__db_pthread_mutex_prep.isra.0':
    mut_pthread.c:(.text+0x2c): undefined reference to `pthread_rwlock_trywrlock'
    mut_pthread.c:(.text+0x34): undefined reference to `pthread_mutex_trylock'
    mut_pthread.c:(.text+0xb0): undefined reference to `pthread_rwlock_wrlock'
    mut_pthread.c:(.text+0x100): undefined reference to `pthread_rwlock_wrlock'

I'm investigating.

>       bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/67623f87f8bc2c73f30bdc3943c58238686c106e/

    src/process/sysdep_LINUX.c: In function 'initprocesstree_sysdep':
    src/process/sysdep_LINUX.c:207: error: 'GLOB_ONLYDIR' undeclared (first
    use in this function)

Not sure, but GLOB_ONLYDIR should come from the C library. I will
investigate.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
