From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 08:53:44 +0200
Subject: [Buildroot] [PATCH 11/12 v3] support/scripts: use show-info to
 extract dependency graph
In-Reply-To: <5cbd07729d823_6f5c2ad964f8616052718@ultri5.mail>
References: <cd1c2cccd0a2d39ba4ab7277d09ae0364ffa17f8.1555357645.git.yann.morin.1998@free.fr>
 <5cbd07729d823_6f5c2ad964f8616052718@ultri5.mail>
Message-ID: <20190422065344.GA6200@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

[Typoes fixed, thanks.]

On 2019-04-21 21:14 -0300, Ricardo Martincoski spake thusly:
> On Mon, Apr 15, 2019 at 04:47 PM, Yann E. MORIN wrote:
> > Since show-dependency-graph never went into a release so far, and
> > show-info does provide the same (and more), swith to using show-info.
[--SNIP--]
> When I do this before and after this patch:
> $ make qemu_arm_versatile_defconfig
> $ make graph-depends
> The color for "rootfs-common" and "rootfs-ext2" changes.
> Can you reproduce it?

Yes.

> Is this intended?

More or less, yes.

> If not intended, do we care enough?

IMHO, not really.

However, I still have further improvements to do about the graphs, and
one of them was to add a new 'colour' to rootfs items.

> 
> [snip]
> > +        versions[pkg] = \
> > +            None if pkg_list[pkg]["type"] == "rootfs" \
> > +            else "virtual" if pkg_list[pkg]["virtual"] \
> > +            else pkg_list[pkg]["version"]
> 
> Why not the straightforward version?
>         if pkg_list[pkg]["type"] == "rootfs":
>             versions[pkg] = None
>         elif pkg_list[pkg]["virtual"]:
>             versions[pkg] = "virtual"
>         else:
>             versions[pkg] = pkg_list[pkg]["version"]

Because this is not pythonic!

Seriously, yes, the main reason is to write python scripts in the most
pythonic way I can, for two reasons:

 1- I try to use the idioms and best practices of the language I write
    in, so that those that come later and are pofficient in the language
    can maintain it without having to cleanup before;

 2- I learn python along the way...

So yes, this looks very more pythonic than the if-else-blocs which look
much more like C or shell...

And it takes 6 lines instead of 4! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
