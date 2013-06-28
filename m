From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Jun 2013 19:05:04 +0200
Subject: [Buildroot] Sample configurations / test suite ?
In-Reply-To: <20130627004309.6f15cf53@skate>
References: <20130627004309.6f15cf53@skate>
Message-ID: <20130628170504.GB3165@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-27 00:43 +0200, Thomas Petazzoni spake thusly:
> Currently, the defconfig that we accept in configs/ are defconfig for
> various hardware platforms that should be as minimal as possible: the
> bootloader(s), the kernel, Busybox, the right filesystem images and
> that's it. Since I've been a fairly strong supporter of this approach,
> I continue to believe it makes sense, since there is no way, for a
> particular board, to decide which software components should or should
> not be part of the default configuration for this board.
> 
> However, I am seeing two cases where we would want to have bigger, more
> specific defconfig files:
> 
>  1) As part of a test suite. Things like building Xenomai, RTAI,
>     building a kernel with the various combination (with or without DT,
>     etc.) are not tested by our autobuilders, and we've recently had
>     reports of Xenomai being broken for example. Having a set of
>     configurations that are interesting to build would be very useful,
>     and this set could be extended when we think it is necessary (for
>     example after receiving a bug report). Those configurations could
>     be built on a daily basis, they could have some custom post-image
>     script to verify that the build has generated everything that was
>     expected, etc.
> 
>  2) As part of a set of demonstration defconfigs. For example, Spenser
>     Gilliland has recently posted on his blog a defconfig that
>     demonstrates how to use OpenMAX on Raspberry Pi to do
>     hardware-accelerated video decoding. Maybe it would make sense to
>     have a way of storing those "demonstration" configurations
>     somewhere, so that they gain in visibility and can more easily be
>     re-used by users.
> 
> What do you think about this? Do you have ideas on how to implement
> this? Should it be part of the Buildroot tree itself, or something
> separate? If something separate, how do we keep Buildroot and this
> separate tree in sync?

For what it's worth, I've started something along those lines. This is
for now a simple git-tree with a few (RPi-related for now) defconfigs
and a collection of scripts.

For lack of a better name, I've called it 'Buildroot.config'. You can
browse the tree there:
    http://ymorin.is-a-geek.org/git/buildroot.config/

The basic idea I've had for this was to automate building a known
Buildroot configuration, from cloning the Buildroot tree, up to
generating the final images.

It's still rough on the edges, and still lacks all the glue to make it
work seamlessly. I'm currently implementing a simple script that would
wrap all of this, but I still need to make some design decisions.

I wanted to wait yet a bit more before advertising it, but since you
raised the question, here it goes public! Well, Peter already knew, but
it's yet more public, now! :-)

Maybe this Buildroot.config tree is something we can improve with the
aim of making it the basis of this full-blown defconfig-for-tests
infrastructure. Please tell me what you think about it! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
