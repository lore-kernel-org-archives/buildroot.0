From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 22:13:36 +0200
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
In-Reply-To: <CAAEAJfB7bjvsdGCOc+5Rzt39ERfvfC=sSYKtKUtGwDLXiBDLdA@mail.gmail.com>
References: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140715205341.77237719@free-electrons.com>
 <CAAEAJfB7bjvsdGCOc+5Rzt39ERfvfC=sSYKtKUtGwDLXiBDLdA@mail.gmail.com>
Message-ID: <20140715201336.GE3351@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel, Thomas, All,

On 2014-07-15 16:49 -0300, Ezequiel Garc?a spake thusly:
> On 15 July 2014 15:53, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Ezequiel Garcia,
> >
> > On Tue, 15 Jul 2014 15:26:34 -0300, Ezequiel Garcia wrote:
> >> It's often desirable to specify a list of patches, in addition to the current
> >> support to pass a directory full of uboot-*.patch files. This matches the
> >> option currently available for specifying Linux patches, except this commit
> >> doesn't add the URL option. Relying on URLs is fragile and makes a build hard
> >> to reproduce.
> >>
> >> U-Boot is as special as Linux, in the sense that it needs to be customized more
> >> often than not, so having a flexible mechanism is useful.
> >>
> >> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >> ---
> >>  Config.in.legacy     | 14 ++++++++++++++
> >>  boot/uboot/Config.in | 11 ++++++-----
> >>  boot/uboot/uboot.mk  | 12 ++++++++----
> >>  3 files changed, 28 insertions(+), 9 deletions(-)
> >
> > We now have BR2_GLOBAL_PATCH_DIR, so I believe that what we would
> > recommend to use from now on. We have even been talking about removing
> > the Linux-specific and U-Boot specific patching config options.
> >
> 
> Yeah, Yann already said that on IRC when I asked him about this patch.
> You guys are really in sync! :)
> 
> The thing is that Linux and U-Boot are not the regular package, since
> almost every BR user using it for a custom product will need to
> customize the kernel and the bootloader to some extent.
> 
> At least from my perspective, it's nice to have the patches (instead
> of pointing to some git branch) and be forced to see what
> modifications I'm using.
> 
> And to produce the patches, I use git-format-patch (aren't we all?),
> which doesn't allow to specify a prefix for the patches. This has been
> discussed and rejected, so don't think the feature will ever be added.

Now I remember that we talked about this on IRC the other day.

The more I think about it, the more I find our policy to require
PKG-prefixed patches to be really cumbersome, since the patches already
are in a subdir named PKG/

Of course, we're enforcing this naming scheme in BR2_GLOBAL_PATCH_DIR to
be in sync with what we do for our bundled patches.

But still, if patches were just named NNNN-title.patch, that would be as
efficient at sorting the patches. The PKG- prefix is not really
required, and indeed can cause some troubles with some use-cases, such
as yours.

Thomas, was there a specific reason we wanted the patches to be
PKG-prefixed? If not, would it make sense to just accept patches without
a PKG-prefix?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
