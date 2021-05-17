From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:17:17 +0200
Subject: [Buildroot] [PATCH v1] package/localedef: fix host gcc-11.x
 compile
In-Reply-To: <20210514175429.20552-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 14 May 2021 19:54:29 +0200")
References: <20210514175429.20552-1-ps.report@gmx.net>
Message-ID: <87r1i5kqle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add two upstream patches fixing host gcc-11.x compile.
 > Fixes:

 >   - https://bugs.busybox.net/show_bug.cgi?id=13806

 >   In file included from ../include/pthread.h:1,
 >                    from ../sysdeps/nptl/thread_db.h:25,
 >                    from ../nptl/descr.h:32,
 >                    from ../sysdeps/x86_64/nptl/tls.h:130,
 >                    from ../sysdeps/generic/libc-tsd.h:44,
 >                    from ./localeinfo.h:224,
 >                    from programs/ld-ctype.c:37:
 >   ../sysdeps/nptl/pthread.h:734:47: error: argument 1 of type ?struct __jmp_buf_tag *? declared as a pointer [-Werror=array-parameter=]
 >     734 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
 >         |                         ~~~~~~~~~~~~~~~~~~~~~~^~~~~
 >   In file included from ../include/setjmp.h:2,
 >                    from ../nptl/descr.h:24,
 >                    from ../sysdeps/x86_64/nptl/tls.h:130,
 >                    from ../sysdeps/generic/libc-tsd.h:44,
 >                    from ./localeinfo.h:224,
 >                    from programs/ld-ctype.c:37:
 >   ../setjmp/setjmp.h:54:46: note: previously declared as an array ?struct __jmp_buf_tag[1]?
 >      54 | extern int __sigsetjmp (struct __jmp_buf_tag __env[1], int __savemask) __THROWNL;
 >         |                         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
