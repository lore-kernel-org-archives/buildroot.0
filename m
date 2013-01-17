From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 17 Jan 2013 17:09:53 +0000
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F82C1B.2040709@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com> <20130117000037.39ccc628@skate>
 <50F74776.60503@petroprogram.com> <20130117093159.2d46ecfd@skate>
 <50F8019C.4000003@petroprogram.com>
 <CA+wH296eA55hCFSpuuX8TVDhxt7EpnVmAT0p5ciV39x_qZnW-Q@mail.gmail.com>
 <50F82C1B.2040709@petroprogram.com>
Message-ID: <CA+wH295dD1eRwkfBXorP78zxcjy4jKPuLOK87bjqoR79R9OY=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 January 2013 16:51, Stefan Fr?berg
<stefan.froberg@petroprogram.com> wrote:
> Is it true that musl supports (at least most) of the glibc ABI ?
> (my biggest worry so far when using uClibc is that I encounter an
> application that is provided as glibc-only
> binary and no source code provided.)

Yes, this is one of the goals. There was a big discussion on the musl
mailing list <http://dir.gmane.org/gmane.linux.lib.musl.general> in
December. One of the aims is glibc ABI compatibility, with
applications like Opera being discussed on the list. Development is
*very* active and Rich Felker (lead dev) seems to respond very quickly
to issues or bug reports.

In fact, I've fallen behind following the musl mailing list the last
couple of months but see a recent posts that indicate there has been
good glibc ABI progress
<http://article.gmane.org/gmane.linux.lib.musl.general/2549>. Of
course many of the proprietary apps are likely to use C++, and the C++
ABI is...fiddly.

> What about it's configuration ? Does it have nice kconf style  "make
> menuconfig" like uClibc or what ?

I don't *think* so, but could be wrong. Still, it aims to be
substantially lighterweight than glibc, while hopefully providing more
performant implementations of functions than either glibc or uclibc.

Alex
