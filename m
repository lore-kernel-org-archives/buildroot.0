From: bruce bushby <bruce.bushby@gmail.com>
Date: Thu, 24 Feb 2011 17:51:10 +0000
Subject: [Buildroot] New Buildroot install setup issues
In-Reply-To: <0D753D10438DA54287A00B027084269764D0949BF6@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269764D0949BF6@AUSP01VMBX24.collaborationhost.net>
Message-ID: <AANLkTi=t3JD72CuVnJ3X=3+yLKd4zhAQyrT-D3VdTW7v@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Could it be 32/64bit packages?

[bruce at core ~]$
[bruce at core ~]$ ls -l /lib/ld-linux.so.2
lrwxrwxrwx 1 root root 12 2011-02-17 16:53 /lib/ld-linux.so.2 ->
ld-2.11.2.so
[bruce at core ~]$
[bruce at core ~]$ ls -l /lib/ld-2.11.2.so
-rwxr-xr-x 1 root root 143400 2010-10-22 19:07 /lib/ld-2.11.2.so
[bruce at core ~]$
[bruce at core ~]$ rpm -qf /lib/ld-2.11.2.so
glibc-2.11.2-3.i686
[bruce at core ~]$
[bruce at core ~]$

On Thu, Feb 24, 2011 at 5:37 PM, H Hartley Sweeten <
hartleys@visionengravers.com> wrote:

> Hello all,
>
> I am setting up a new system with Buildroot and ran into a problem that I
> have not seen before.
>
> The system has a fresh install of Fedora 14 on it.  I cloned a new copy of
> Buildroot last night then did a make menuconfig and setup everything like
> my current system.  The problem occurs when setting up the
> external-toolchain.
>
> mkdir -p /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain
> bzcat
> /export/kdrive/mvr/mx35/devel/buildroot/dl/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> | tar --strip-components=1 -C
> /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain  -xf -
> /din/sh:
> /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain/bin/arm-none-linux-gnueabi-gcc:
> /lib/ld-linux.so.2: bad ELF interpreter: No such file or directory
> readlink: missing operand
> Try `readlink --help` for more information.
> /bin/sh: line 5: @echo: command not found
> make: ***
> [/export/kdrive/mvr/mx35/devel/buildroot/output/stamps/ext-toolchain-installed]
> Error 1
>
> Any ideas?
>
> Thanks,
> Hartley
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110224/788fd7b6/attachment.html>
