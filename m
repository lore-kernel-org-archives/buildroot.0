From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 9 Dec 2019 11:03:08 -0800
Subject: [Buildroot] [PATCH v6 1/6] package/polkit: bump to version 0.116
In-Reply-To: <20191208205847.76c05a1f@windsurf.home>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191208160213.030635f6@windsurf.home>
 <CAFSsvmqCnXXkjMtJiPOpHx0E8Xv4fHcOuNw3qSSn52i9F-6yPg@mail.gmail.com>
 <20191208205847.76c05a1f@windsurf.home>
Message-ID: <CAFSsvmopSyRoAriDm-5yKuh4pJYEvBbe1HmaL8jsoC9AaaMjdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sun, Dec 8, 2019 at 11:58 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 8 Dec 2019 11:04:16 -0800
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > > One direction that would be nice to look at is to enable spidermonkey
> > > and then polkit on uClibc. Regarding the fenv issue, perhaps we could
> > > have a boolean that says whether uClibc provides fenv support for the
> > > current architecture, and then treat this as an architecture dependency
> > > inside BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS ? How many architectures
> > > have sufficient fenv support in uClibc for spidermonkey ?
> > >
> > Not many, Yann and I had a conversation about this earlier and it
> > doesn't seem worth it.
>
> OK.
>
> > Perhaps instead we could put the same effort into a variable that
> > checks for uclibc fts support.
> > That way selinux can be enabled with uclibc:
>
> SELinux can already be enabled on uClibc. I added the musl-fts package,
> and used it in libselinux to make it available for uClibc/musl.
>
> When you're grumpy, please verify your claims :-)
>
I'm aware of the option, but I don't agree with it. It's built into
uClibc and requiring
an extra package is not nice in my opinion.

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Adam
