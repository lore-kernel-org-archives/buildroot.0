From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 4 Feb 2019 15:18:20 +0100
Subject: [Buildroot] [PATCH v1 0/5] WPE WebKit
In-Reply-To: <20181231154915.32660-1-francois.perrad@gadz.org>
References: <20181231154915.32660-1-francois.perrad@gadz.org>
Message-ID: <20190204151820.GB1202@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

First of all, sorry for taking quite some time in getting back to this
patch series; it caught me around the holidays and a busy start of the
year (happy 2019, by the way!). Luckily, I have some spare cycles today
after FOSDEM :)


On Mon, 31 Dec 2018 16:49:10 +0100, Francois Perrad <fperrad@gmail.com> wrote:
> Another port of WebKit (https://wpewebkit.org/), a project started in 2018.
> 
> rfc -> v1
>   - full refactor after Adrian's review
>   - libwpe : version 1.0.0 (stable) instead of 1.1.0 (instable)
>   - wbebackend-fdo : version 1.0.0 (stable) instead of 1.1.0 (instable)
>   - add cog, a WPE WebKit launcher

Some general comments about the patch set: it is looking pretty good overall,
and I have successfully built images with Cog (and all the dependencies) for
the Raspberry Pi (AArch64) and the Wandboard (ARMv7). I don't have the boards
around to boot the images, but I trust Cog works because I have been using
myself these same versions of the source packages using BR2_EXTERNAL :)

That being said, I would like to share some configuration bits among both
WebKitGTK+ and WPE WebKit, like the Config.in bits to determine whether the
target architecture supports JIT. The reason why this can be shared is that
both WebKit ports are released from the *same* upstream branch, even if the
tarballs are different. Also, major and minor version numbers (but not the
micro version number) go in tandem so it is easy to make sure things are kept
in sync: for example all WebKitGTK+ 2.22.X releases use the same source tree
as the WPE WebKit 2.22.Y versions.

I *think* that it may be acceptable to merge this patch set first, and after
that we would make a follow-up patch to share among both packages the common
parts. We talked about this during FOSDEM (mainly with Thomas) and my
impression is that we share the goal of trying to avoid the duplicated code.
Unfortunately it seems it would be much harder to also unify the QtWebKit
bits, so at first we will not be trying to include it.

> Francois Perrad (5):
>   libwpe: new package
>   wpebackend-fdo: new package
>   webkitgtk: remove GTK in WEBKITGTK_ARCH_SUPPORTS* variable names
>   wpewebkit: new package
>   cog: new package

I'll comment on each commit separately in a few moments :)

Cheers,


-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190204/8e56880b/attachment.asc>
