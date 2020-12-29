From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 15:15:51 +0100
Subject: [Buildroot] [PATCH 00/10 v3] support/download: reproducible
 archives whatever tar version (branch yem/dl-git-tar-pax-2)
In-Reply-To: <20201229134610.GL1680670@scaer>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <20201229140926.4482f6f9@windsurf.home>
 <20201229134610.GL1680670@scaer>
Message-ID: <20201229151551.112ee052@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Dec 2020 14:46:10 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I was also considering a similar mechanism for the vendoring thingy...
> 
> My initial thought was to have a ways to extend this extra format
> version. I am not entirely sure how to do it, but probably something
> along the lines of:
> 
>     define cargo-inner
>     $(2)_VENDOR_VERSION = _cargo
>     endef
> 
>     define generic-inner
>     $(2)_SOURCE_EXT = $$($(2)_VENDOR_VERSION)$$(BR_FMT_VERSION_$$($(2)_SITE_METHOD)).tar.gz
>     endef
> 
> But this is not as nice as I'd like it to be... If you have another
> idea, please be my guest. ;-)

Hum, yes, that's an idea. We would still to change in lock-step all
.hash files for all cargo/go packages, even the ones that don't need
any vendoring. We also end up with pretty weird tarball names, like
_cargo_br1.tar.gz.

But oh well, perhaps that the price to pay to get all of this to work ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
