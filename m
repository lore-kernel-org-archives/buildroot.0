From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2016 20:55:05 -0700
Subject: [Buildroot] compiler plugins & compiling the kernel
In-Reply-To: <CAMKF1sqteu5nK9NGfr1M=A3nZFk2H_J5zhu3BYq0110sjz8vDQ@mail.gmail.com>
References: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
 <CAMKF1sr1ZvZZW++J4pxixtr1KXGi8qGBRFEJGoaJSc_=Yn=x3Q@mail.gmail.com>
 <CAMKF1sqteu5nK9NGfr1M=A3nZFk2H_J5zhu3BYq0110sjz8vDQ@mail.gmail.com>
Message-ID: <CAMKF1sr4gNndhcJ80gv10kzBaEBhFKKpryKb8U_1z5ACWcWKhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Aug 20, 2016 10:10 AM, "Kenneth Adam Miller" <kennethadammiller@gmail.com>
wrote:
>
> Hello all,
>
>
> I've noticed that when the kernel is built, it appears to always be
> built with the host compiler, and not the buildroot specified cross
> compiler. Why is that?
>

Some portions are compiled for the build host. E.g. Tools. They will always
use native compiler. But the kernel proper should be using cross compiler

> In addition, for some pax related options, it requires gcc plugins for
> the version being used. That means that I would have to have plugin
> support for my host, correct? I don't believe that there is a way to
> enable plugin support for the buildroot toolchain or for crosstool. At
> least, when I looked and searched I didn't see any option that
> mentioned that. I just want to make sure that I have it correct in
> that my host compiler is being used to build the kernel.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160820/e1001007/attachment.html>
