From: Bob Liu <lliubbo@gmail.com>
Date: Tue, 31 May 2011 11:36:10 +0800
Subject: [Buildroot] Build qt failed after update to 2011.05
In-Reply-To: <BANLkTimquVO2HCyVDp4ekXJGGL+vGDTkAQ@mail.gmail.com>
References: <BANLkTikfUw4jOL6zYGxdqbFyWT+pjV7X3w@mail.gmail.com>
	<BANLkTimquVO2HCyVDp4ekXJGGL+vGDTkAQ@mail.gmail.com>
Message-ID: <BANLkTikUmY9+UuQ4mPp7HYth-7ed4iVdUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 30, 2011 at 10:35 PM, Christopher Boumenot
<boumenot@gmail.com> wrote:
> On Mon, May 30, 2011 at 3:47 AM, Bob Liu <lliubbo@gmail.com> wrote:
>>
>> Hi, folks
>>
>> After I updated to 2011.05 release, I failed to build qt.
>>
> [snip]
>
>>
>> Any ideas is welcome, Thanks!
>>
>
> I figured if it worked for ruby it would work for qt. ?I was able to build
> with this commit reverted.

Thanks for you reply.

After revert this commit the error disappeared, but I got another issue.

linking ../../lib/libQtCore.so.4.7.1
/lib/libpthread.so.0: file not recognized: File format not recognized
collect2: ld returned 1 exit status
make[2]: *** [../../lib/libQtCore.so.4.7.1] Error 1

It seems qt find the wrong libpthread, but I don't know why.

root # file ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/lib/libpthread-2.11.1.so
./output/host/usr/arm-unknown-linux-gnueabi/sysroot/lib/libpthread-2.11.1.so:
ELF 32-bit LSB shared object, ARM, version 1 (SYSV), dynamically
linked (uses shared libs), for GNU/Linux 2.6.16, not stripped


> ?commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
> Author: Peter Korsgaard <jacmet@sunsite.dk>
> Date: ? Fri Apr 29 15:40:58 2011 +0200
> ? ? package/Makefile.in: CFLAGS/LDFLAGS: don't add -I / -L args for
> STAGING_DIR
> ? ? Now that we use sysroot for all toolchains, the explicit -I / -L
> arguments
> ? ? in CFLAGS / LDFLAGS aren't needed anymore (And having them makes the
> build
> ? ? quite noisy for certain packages as STAGING_DIR/include normally doesn't
> ? ? exist).
> ? ? Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>
> Chris
>

-- 
Regards,
--Bob
