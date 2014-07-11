From: IoriBranford . <ioribranford@gmail.com>
Date: Thu, 10 Jul 2014 23:04:46 -0400
Subject: [Buildroot] [rpi-userland] Trying to dlopen libGLESv2,
 can't resolve libEGL function symbols
In-Reply-To: <20140710032021.57b3bb8a@core2quad.morethan.org>
References: <CABqEe+mvMi6aLkCbc1_0XZMN-RX7c9MNMYQOoPU5yc7KY6_iAg@mail.gmail.com>
 <20140710032021.57b3bb8a@core2quad.morethan.org>
Message-ID: <CABqEe+=Q5Gpyc4x-XQVCLObmDhW8ESVTONYujWYKidySDAcHMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My output doesn't change; I guess I would have to somehow add LD_DEBUG
support to my system.

I do get the app to run with LD_PRELOAD=libEGL.so:libGLESv2.so. Hopefully
only a temporary measure, but will have to do for now.
Thanks.


On Thu, Jul 10, 2014 at 4:20 AM, Mike Zick <minimod@morethan.org> wrote:

> On Thu, 10 Jul 2014 02:38:44 -0400
> "IoriBranford ." <ioribranford@gmail.com> wrote:
>
> > My expertise runs thin here, so, I don't see where else the issue
> > could be. Hopefully someone can help?
> > Thanks.
> >
>
> Find out where the loader is looking for the libraries:
>  $ LD_DEBUG=libs witchfire
>
> Compare that list of paths with where the libraries actually are at,
> it my just be a stale ldconfig cache file.
>
> Mike
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/bac79388/attachment.html>
