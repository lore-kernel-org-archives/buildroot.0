From: Cheng Renquan <crquan@gmail.com>
Date: Wed, 15 Apr 2009 09:36:52 +0800
Subject: [Buildroot] Does uclibc support 64KB PAGE_SIZE kernel? how to?
Message-ID: <91b13c310904141836j1c984dect67815e3f3d653653@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, all uclibc and buildroot people,

I have a problem using uclibc and buildroot with 64KB PAGE_SIZE kernel,
it is amcc powerpc embedded platform, it support 4KB, 16KB, 64KB, and
256KB PAGE_SIZE,
I have tried 4KB kernel, the buildroot with uclibc images can run well with 4KB,

but now I have other reasons to use 64KB PAGE_SIZE, and other glibc
images can run well with 64KB PAGE_SIZE,
while uclibc seems can not, it boot failed with:

Freeing unused kernel memory: 384k init
/sbin/init:572: can't map '/lib/libc.so.0'
/sbin/init:572Kernel panic - not syncing: Attempted to kill init!
: can't map '/liRebooting in 1 seconds..b/libc.so.0'
/sbin/init: can't load library 'libc.so.0'

the /sbin/init is from busybox and built with uclibc, it seems unable
to run in 64KB,

Is there someone know how to run with 64KB PAGE_SIZE kernel, with a
uclibc-config option or other documentation?

Thanks,

-- 
Cheng Renquan (???), from Shenzhen, China
