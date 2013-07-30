From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 30 Jul 2013 07:54:51 +0300
Subject: [Buildroot] Libraries built with buildroot can only be used by
 buildroot itself.
In-Reply-To: <20130730044000.GA24161@zuhnb712.ap.bm.net>
References: <20130730044000.GA24161@zuhnb712.ap.bm.net>
Message-ID: <CAAHaz6EPsOZRKAFp_Y7M77WVH+pgR1XzMtMumRBDQ-hreM7fGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Woody!

2013/7/30 Woody Wu <narkewoody@gmail.com>In case one, I set my path to use
the gcc from my own Codesourcery

> installation, which is the same version as that buildroot is using.
> Actually, this Codesourcery installation is a direct uncompress from the
> tarball that buildroot downloaded from net to its download directory.
>
> In case two, I set my path to use the gcc directly in buildroot, i.e,
> under /home/woody/buildroot-2013.05/host/usr/bin
>
> In case two, it built with success. But case one, it did not:
>
> /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
> skipping incompatible /lib/libc.so.6 when searching for /lib/libc.so.6
> /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
> cannot find /lib/libc.so.6
> /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
> skipping incompatible /usr/lib/libc_nonshared.a when searching for
> /usr/lib/libc_nonshared.a
> /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
> cannot find /usr/lib/libc_nonshared.a
> /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
> cannot find /lib/ld-linux.so.3
> collect2: ld returned 1 exit status
>

  It looks like in case one ld installed to /home/woody/arm-2012.03 is used
to reading binaries for another architecture. Are you absolutely sure that
this is a _cross_ toolchain?

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130730/7b6ecded/attachment.html>
