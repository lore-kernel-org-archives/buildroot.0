From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Feb 2014 23:56:12 +0100
Subject: [Buildroot] [PATCH v7 2/4] udev: convert to virtual package.
In-Reply-To: <20140207211433.GA7580@milhouse>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
 <CAAXf6LWN2F6YhoVHu3w-TcWnqBQ4G_gdV652xBD0kGbopfafWw@mail.gmail.com>
 <20140207211433.GA7580@milhouse>
Message-ID: <20140207225612.GF3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?ric, Thomas, All,

On 2014-02-07 22:14 +0100, Eric Le Bihan spake thusly:
> On Fri, Feb 07, 2014 at 09:17:08PM +0100, Thomas De Schampheleire wrote:
> 
> > > diff --git a/Config.in.legacy b/Config.in.legacy
> > > index 2fe9cf9..6d594c6 100644
> > > --- a/Config.in.legacy
> > > +++ b/Config.in.legacy
> > > @@ -101,6 +101,61 @@ endif
> > >  ###############################################################################
> > >  comment "Legacy options removed in 2014.02"
> > >
> > > +config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> > > +       bool "/dev management by udev removed"
> > > +       select BR2_LEGACY
> > > +       help
> > > +         The 'udev' package has been converted to a virtual package.
> > > +         There is currently one provider for this feature: 'eudev'.
> > > +
> > > +         Therefore, you must choose 'Dynamic using eudev' in the
> > > +         '/dev management' menu to get the same behaviour as in your
> > > +          old configuration.
> > > +
> > > +         You must also check the packages depending on 'udev' are still
> > > +         selected.
> >
> > Is there a particular reason why you don't automatically select the
> > suggested alternative?
> > This will make the transition easier for users...
> 
> That's what I did on first try. BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV was
> selected. But I ended up facing a limit of kconfig: this boolean symbol is
> used in a choice/endchoice ("/dev management"), which prevents its value from
> being recalculated when it is selected from Config.in.legacy.
> 
> For example, if BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y in
> test_udev_legacy_defconfig and we perform:
> 
>   $ make test_udev_legacy_defconfig
> 
> output/.config will contain:
> 
>   # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is not set
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
> 
> The default choice is selected. I discussed this issue on IRC with Yann E.
> Morin last evening, but there is no workaround... So I chose to remove the
> automatic selection of the new symbol and add detailed instructions.

Indeed. The explanation above (a shorter one, at least) should have been
part of the commit log.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
