From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 11:02:56 +0200
Subject: [Buildroot] [PATCH] fs/cpio: make cpio rootfs reproducible
In-Reply-To: <e4d54ca8-8d14-a42f-cb71-a370575c0e11@mind.be>
References: <20190712172320.23108-1-itsatharva@gmail.com>
 <e4d54ca8-8d14-a42f-cb71-a370575c0e11@mind.be>
Message-ID: <20190714090256.GJ2680@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Atharva, All,

On 2019-07-14 00:34 +0200, Arnout Vandecappelle spake thusly:
> On 12/07/2019 19:23, Atharva Lele wrote:
> > Pass the recommended argument in the CPIO manual to make cpio archives
> > reproducible.
[--SNIP--]
> > +ifeq ($(BR2_REPRODUCIBLE), y)
> > +CPIO_OPTS = --reproducible
> 
>  Unfortunately, this option was only introduced in cpio 2.12 (2015). Older
> distros, including Debian oldstable and Ubuntu 2016.04, both of which are still
> being maintained, have an earlier cpio version (2.11) so don't have this option.
> 
>  Therefore, I think we have to check for a suitable system cpio and build
> host-cpio if it is not suitable. Or maybe, for reproducible, always build
> host-cpio?

If we are reproducible, then always build our cpio version.

We currently do not have a host-cpio package, but it is relatively
trivial to add (patch pending). Yet, I tried and it adds about 25s to
the build, somewhat comparable to the overhead for host-tar...

If someone gets sufficiently annoyed by the overhead, they'll provide
a patch to switch to checking for a suitable cpio.

But in any case, I think that people who do care about reproducibility,
do care more about it than they do about time.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
