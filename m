From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 30 Sep 2016 04:57:38 +0200
Subject: [Buildroot] uclibc-ng: bump to 1.0.18
In-Reply-To: <cc0e811d-72bf-5b85-c4ad-7b10f5e79aeb@gmail.com>
References: <48e09c43-e43d-f67f-c6cb-b640c367ab5a@gmail.com>
 <20160929182247.GK1947@waldemar-brodkorb.de>
 <cc0e811d-72bf-5b85-c4ad-7b10f5e79aeb@gmail.com>
Message-ID: <20160930025738.GM1947@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lance,
Lance Fredrickson wrote,

> On 9/29/2016 12:22 PM, Waldemar Brodkorb wrote:
> >It is fixed upstream and a patch was sent to br mailinglist.
> 
> Thanks, that seems to take care of it.
> I'm running into one more hiccup, and I'm not sure whether this is more
> buildroot or uclibc-ng.
> 
> I've been using buildroot primarily for its ability to create toolchains, I
> haven't been compiling any included packages.  For my purposes I need
> backtrace support, so I add "UCLIBC_HAS_BACKTRACE=y" into uClibc-ng.config.
> Now when doing the final GCC compilation where it appears to be creating
> libgcc, I get the following error.
> 
> /opt/tomatoware/arm-soft-mmc/usr/arm-buildroot-linux-uclibcgnueabi/bin/ld:
> cannot find /lib/libubacktrace.so.1
> 
> My guess as to what's happening is is that ld is told to link with
> backtrace, but that functionality has been has been put into libc. At the
> location of the toolchain libraries, I created some symlinks from backtrace
> (libubacktrace.so...) to libc and this made it happy and it finished
> compiling the toolchain.  So I think either in the compilation process, it
> needs to not pass backtrace to the linker, or it needs a symlink to libc
> like I've placed.

I think another uClibc-ng regression, can you please try attached
buildroot patch?

best regards
 Waldemar
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0006-uclibc-remove-linker-scripts-for-libubacktrace-libua.patch
Type: text/x-diff
Size: 4654 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160930/0f06e85a/attachment.bin>
