From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Nov 2012 09:02:18 +0100
Subject: [Buildroot] How to regenerate zImage?
In-Reply-To: <CAAsE_ud49Ku0NKg-8Ku1mbMXVxkSfLNefvV6pnst2B9GD-4o+A@mail.gmail.com>
References: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
 <20121120100158.15b1b159@skate>
 <slrnkamq24.2u9.narkewoody@zuhnb712.local.com>
 <20121121103844.0eeefba6@skate>
 <CAAsE_ud49Ku0NKg-8Ku1mbMXVxkSfLNefvV6pnst2B9GD-4o+A@mail.gmail.com>
Message-ID: <20121126090218.69c0b3af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

Please do not reply to me directly: always keep the list Cc'ed.

On Mon, 26 Nov 2012 15:32:52 +0800, Woody Wu wrote:
> > Two solutions:
> >
> >  *) Do the build of the component you're actively working on outside of
> >     Buildroot. Typically, when I do kernel hacking, I do it outside of
> >     Buildroot, and I use Buildroot only as a final integration
> >     mechanism, to make sure that the system build process is
> >     reproducible. But not during development.
> >
> >  *) Use the OVERRIDE_SRCDIR mechanism, as documented in
> >     http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf,
> >     slide 41.
> >
> > Best regards,
> >
> > Thomas
> 
> Thanks for the excellent slides.  But I don't understand, where to
> input the "LINUX_OVERRIDE_SRCDIR=/my/path/of/linux".  Did I miss
> something?

You should put it in a file called "local.mk" at the root of the
Buildroot sources directory. Note that "local.mk" is the default
name/location, you can tune that using BR2_PACKAGE_OVERRIDE_FILE.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
