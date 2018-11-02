From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 00:40:25 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-wCtxCGUWfA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #1 from goldstar611 at hotmail.com ---
Latest stable (buildroot-2018.08.2) also fails with same error

```
...
mv -f .deps/sjlj.Tpo .deps/sjlj.Plo
In file included from
/home/user/buildroot-2018.08.2/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/stdio.h:862:0,
                 from ../../../libitm/util.cc:27:
/home/user/buildroot-2018.08.2/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:
In function ?int sprintf(char*, const char*, ...)?:
/home/user/buildroot-2018.08.2/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:34:43:
error: invalid use of ?__builtin_va_arg_pack ()?
       __bos (__s), __fmt, __va_arg_pack ());
                                           ^
/home/user/buildroot-2018.08.2/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:
In function ?int snprintf(char*, size_t, const char*, ...)?:
/home/user/buildroot-2018.08.2/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:65:44:
error: invalid use of ?__builtin_va_arg_pack ()?
        __bos (__s), __fmt, __va_arg_pack ());
                                            ^
Makefile:517: recipe for target 'util.lo' failed
make[5]: *** [util.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
```

-- 
You are receiving this mail because:
You are on the CC list for the bug.
