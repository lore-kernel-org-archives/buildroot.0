From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 May 2021 18:29:06 +0000
Subject: [Buildroot] [Bug 13806] Building host-localedef fails on fedora
 34/gcc 11
In-Reply-To: <bug-13806-163@https.bugs.busybox.net/>
References: <bug-13806-163@https.bugs.busybox.net/>
Message-ID: <bug-13806-163-zIw5yHUTyE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

--- Comment #8 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Dr I J Ormshaw from comment #7)

> Applying 0003-v1-package-localedef-fix-host-gcc-11.x-compile.patch using patch: 
> patching file package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
> patching file package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch

This looks wrong...., your patch is patching the buildroot sources and not the
host-localedef ones...., the output should look like the following:

[...]
Applying 0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch using
patch:
patching file include/bits/types/struct___jmp_buf_tag.h
patching file setjmp/Makefile
patching file setjmp/bits/types/struct___jmp_buf_tag.h
patching file setjmp/setjmp.h
patching file sysdeps/nptl/pthread.h

Applying 0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch using
patch:
patching file misc/sys/cdefs.h
patching file sysdeps/nptl/pthread.h
[...]

Howto apply a patch from patchwork:

    $ wget https://buildroot.org/downloads/buildroot-2021.02.2.tar.gz
    $ tar -xvzf buildroot-2021.02.2.tar.gz
    $ curl -O -J
https://patchwork.ozlabs.org/project/buildroot/patch/20210514175429.20552-1-ps.report at gmx.net/mbox/
    $ cd buildroot-2021.02.2
    $ patch -p 1 < ../v1-package-localedef-fix-host-gcc-11.x-compile.patch

-- 
You are receiving this mail because:
You are on the CC list for the bug.
