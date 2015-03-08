From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 8 Mar 2015 13:59:58 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-06
In-Reply-To: <20150308081737.3b35f001@free-electrons.com>
References: <20150307073020.C6D511011A8@stock.ovh.net>
 <CAMo8BfJo6EJG4SeU3=ZEBB=9gG+SF9pJ9N0fCHh567o-jpfr5Q@mail.gmail.com>
 <20150307231115.GA2518@tarshish>
 <CAMo8BfKYm-p4ETuX==DQbtz_s=4wpuwemfePnGaOz4G2YmsmYQ@mail.gmail.com>
 <20150308081737.3b35f001@free-electrons.com>
Message-ID: <CAMo8BfLeQdxJSNW9SdP+ACN1cgwnjE0sdavFR9=LxfLc0GYU3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2015 at 10:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Max Filippov,
>
> On Sun, 8 Mar 2015 02:39:34 +0300, Max Filippov wrote:
>
>> I couldn't find any written rule, so am wondering.
>> It may not be a regression per se, but uClibc-ng became a default libc
>> for xtensa, and
>> broken default is arguably a regression.
>
> I posted a set of commits fixing this:
> http://lists.busybox.net/pipermail/buildroot/2015-March/121200.html.

Thank you, Thomas.
Still uclibc build fails for me with the following message:

  GEN include/bits/sysnum.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/structsem.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelbarrier.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/structsem.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/pthread-pi-defines.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelbarrier.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/pthread-pi-defines.h
In file included from ./libpthread/nptl/pthreadP.h:25:0,
                 from <stdin>:2:
./include/sys/syscall.h:24:25: fatal error: bits/sysnum.h: No such
file or directory
 #include <bits/sysnum.h>
                         ^
compilation terminated.
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h]
Error 1
make[1]: *** Waiting for unfinished jobs....

Attached patch fixes it for me.

-- 
Thanks.
-- Max
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Makefile.in-add-missing-dependency-on-bits-sysnum.h-.patch
Type: text/x-patch
Size: 1891 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150308/c6fbceed/attachment.bin>
