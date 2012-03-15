From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Thu, 15 Mar 2012 20:21:30 +0100
Subject: [Buildroot] [PATCH 4/5] Microblaze: build kernel with device
	tree
In-Reply-To: <4F623B98.1050701@relinux.de>
References: <4F5CD7C9.40505@relinux.de> <20120312231055.5ba3a3be@skate>
 <201203140025.24202.arnout@mind.be>
 <CAM+bi4s-yf0Jb1+c17Uee2iDkD995ZGMnNe3JfXxEb9fcMbiKQ@mail.gmail.com>
 <4F623B98.1050701@relinux.de>
Message-ID: <CAM+bi4uABjgOCjsOmOVABZi6JtYqYbCQ9PrfoBmEOXWTpAao9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

To recap a bit more...

I think we can be applying the set of patches that fully work and provide
some independent utility without conflicting with future plans. So, I would
say we could apply at least the following four patches:

* Alvaro: Microblaze: added architecture support for both big endian and
low endian
* Alvaro: Microblaze: added external toolchain from Xilinx
* This also needs "DOWNLOAD: change $1=DIRECTORY_URL, $2=FILE_NAME to
$1=FULL_FILE_URL, $2=FILE_NAME", signed-off also by Peter Korsgaard and
Arnout Vandecappelle, also Acked-by Arnout.

In fact, I would call for this patch to be applied as soon as possible, so
as to set the recently added packages to use the newer DOWNLOAD interface
and avoid a future refactor of already existing packages.

* Stephan: Microblaze: added defconfig for Avnet S6LX9 Microboard

On the other hand, this patch
Stephan: Microblaze: build kernel with device tree

This patch could very well be used, but I am not sure if this should be
directly applied. Maybe it's not a good idea to have an specific patch for
Microblaze's device tree and maybe we should wait to have a generic one?
Maybe we can talk a little about DTS support and decide how to implement
that.


2012/3/15 Stephan Hoffmann <sho@relinux.de> wrote

> What I think is also important, but can be addressed seperatelly:
>
> - Building the toolchain from Source
> - Building the boot loader
> - Accessing the Flash on the Microboard from Bootloader and Linux
>
>
This would totally be great. I've tried to build the toolchain and faced
the same problem as you, Stephan. I still haven't tried anything with the
bootloader nor the flash.


>
> So, what should be the next step?
>
> I can put the patches that I have (the one fixing the toolchain download
> got lost somewhere) together, rebase them to the current HEAD and resend
> them on the weekend.
>
I already squashed the three patches concerning toolchain download into one
> (but that removed Alvaro's entry as Author, which I don't like)
>

I think the patches I refered to before should be enough to allow the
toolchain download. At least, they work for me. They were both ack'ed by
Arnout, so I thought they were tested and good to go. However, if we manage
to build the toolchain from the source, then we won't need it? In either
case, the second one (download) is useful by itself.
* Alvaro: Microblaze: added external toolchain from Xilinx
* This also needs "DOWNLOAD: change $1=DIRECTORY_URL, $2=FILE_NAME to
$1=FULL_FILE_URL, $2=FILE_NAME"


> and renamed the board directory to lower case.
>



> I can also add useful help texts for the architecture selection, but maybe
> Alvaro wants to do this himself.
>
Kind regards
>


If you want, I can take care of this, and maybe add some texts to the other
architectures. Better have them late than never.

Regards,
-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120315/411797e9/attachment.html>
