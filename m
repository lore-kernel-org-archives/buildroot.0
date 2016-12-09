From: Anand Sivaram <aspnair@gmail.com>
Date: Fri, 9 Dec 2016 20:10:30 +0530
Subject: [Buildroot] Compilation error in version: 2016.11,
	package util-linux
Message-ID: <CAHBw83cw_XOYRvXjFdox5XE0TJAxGUXhyQxegWZnW4aSi=9qWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I tried to upgrade my buildroot to 2016.11 from 2016.05.  Now I am getting
a compilation error in util-linux because BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
is enabled and it got enabled automatically because of the newer version of
libglib2. (For me libglib2 has to be enabled in my system).

In 2016.05 version, neither I enabled libmount directly not it got enabled
as a dependency of glib2.0

Target Details:
Toolchain: External gcc-4.7.3, uClibc-0.9.33.2 on MIPS 24Kc.
Build Machine: Debian Testing/Stretch

Compilation Error: Because of have_scanf_alloc_modifier

checking for tgetent in -ltinfo... no
configure: error: libmount selected, but required scanf string alloc
modifier not available
package/pkg-generic.mk:206: recipe for target
'/media/build/buildroot/output/build/util-linux-2.28.2/.stamp_configured'
failed
make[1]: ***
[/media/build/buildroot/output/build/util-linux-2.28.2/.stamp_configured]
Error 1
make[1]: Leaving directory '/media/build/buildroot'
Makefile:292: recipe for target 'buildroot' failed
make: *** [buildroot] Error 2

While searching I found the following patch, but for an older version of
util-linux.
http://repository.timesys.com/buildsources/u/util-linux/util-linux-2.27.1/util-linux-2.27.1-sscanf-no-ms-as.patch

I do not require libmount directly. I could remove dependency of libmount
and disable it from glib2.0 and try to disable the LIBMOUNT flag
altogether.  But, that is a workaround.

Any help would be really appreciated.

Thanks

Anand
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161209/3330f58b/attachment.html>
