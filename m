From: Christopher McCrory <chrismcc@gmail.com>
Date: Tue, 14 Aug 2018 10:44:40 -0700
Subject: [Buildroot] [PATCH 1/3] fake-hwclock: new package
In-Reply-To: <20180814160032.5d2bfce8@windsurf>
References: <20180810144635.16182-1-chrismcc@gmail.com>
 <20180814160032.5d2bfce8@windsurf>
Message-ID: <CALURroRnDriOiyac=DbxOfwJyT6Am4_h_1Xn3_GfPyqJJs7PmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 14, 2018, 7:00 AM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> Yann, Arnout, Peter, there is a question below.
>
> Christopher, there are some review comments as well.
>
> On phone, sorry for formatting.  I'll look into this and the others
tomorrow.  My other job got in the way today.



>
> On Fri, 10 Aug 2018 07:46:34 -0700, Christopher McCrory wrote:
>
> > +if BR2_PACKAGE_FAKE_HWCLOCK
> > +config BR2_PACKAGE_FAKE_HWCLOCK_CRONJOB
> > +        bool "install fake-hwclock cronjob"
> > +        help
> > +          Hourly cronjob to save current timestamp
>
> What should be our policy for cronjobs ? I'm not sure we currently have
> packages that install cronjobs. What should we do? Install
> unconditionally? Have a sub-option?
>
> I would personally lean towards installing unconditionally, but I'd
> like to have others opinions before applying.
>
> > +FAKE_HWCLOCK_VERSION = v0.11
> > +FAKE_HWCLOCK_SITE = https://git.einval.com/git/fake-hwclock.git
> > +FAKE_HWCLOCK_SITE_METHOD = git
> > +FAKE_HWCLOCK_LICENSE_FILES = COPYING
> > +FAKE_LICENSE = GPL-2.0
>
> This variable is wrong: it should be FAKE_HWCLOCK_LICENSE. Also, we
> prefer to have it before the LICENSE_FILES variable.
>
> > +define FAKE_HWCLOCK_NO_LSB
> > +     $(SED) 's at . /lib/lsb/init-functions@#. /lib/lsb/init-functions@' \
> > +             $(@D)/debian/fake-hwclock.init
> > +endef
>
> This should be done by a patch.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180814/0deb8d54/attachment.html>
