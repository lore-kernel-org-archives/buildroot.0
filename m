From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 May 2021 08:53:05 +0000
Subject: [Buildroot] [Bug 13806] Building host-localedef fails on fedora
 34/gcc 11
In-Reply-To: <bug-13806-163@https.bugs.busybox.net/>
References: <bug-13806-163@https.bugs.busybox.net/>
Message-ID: <bug-13806-163-yGH2airzcO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

--- Comment #7 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
Looks like I got confused by the external links.  I think I now have the
intended pathch, but still the same result:

Applying 0003-v1-package-localedef-fix-host-gcc-11.x-compile.patch using patch: 
patching file
package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
patching file
package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch

...

In file included from ../include/pthread.h:1,
                 from ../sysdeps/nptl/thread_db.h:25,
                 from ../nptl/descr.h:32,
                 from ../sysdeps/x86_64/nptl/tls.h:130,
                 from ../sysdeps/generic/libc-tsd.h:44,
                 from ./localeinfo.h:224,
                 from programs/ld-ctype.c:37:
../sysdeps/nptl/pthread.h:734:47: error: argument 1 of type ?struct
__jmp_buf_tag *? declared as a pointer [-Werror=array-parameter=]
  734 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask)
__THROWNL;
      |                         ~~~~~~~~~~~~~~~~~~~~~~^~~~~
In file included from ../include/setjmp.h:2,
                 from ../nptl/descr.h:24,
                 from ../sysdeps/x86_64/nptl/tls.h:130,
                 from ../sysdeps/generic/libc-tsd.h:44,
                 from ./localeinfo.h:224,
                 from programs/ld-ctype.c:37:
../setjmp/setjmp.h:54:46: note: previously declared as an array ?struct
__jmp_buf_tag[1]?
   54 | extern int __sigsetjmp (struct __jmp_buf_tag __env[1], int __savemask)
__THROWNL;
      |                         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
cc1: all warnings being treated as errors

-- 
You are receiving this mail because:
You are on the CC list for the bug.
