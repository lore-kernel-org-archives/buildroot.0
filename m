From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:04:31 +0100
Subject: [Buildroot] [PATCH v6 1/6] package/polkit: bump to version 0.116
In-Reply-To: <CAFSsvmopSyRoAriDm-5yKuh4pJYEvBbe1HmaL8jsoC9AaaMjdA@mail.gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191208160213.030635f6@windsurf.home>
 <CAFSsvmqCnXXkjMtJiPOpHx0E8Xv4fHcOuNw3qSSn52i9F-6yPg@mail.gmail.com>
 <20191208205847.76c05a1f@windsurf.home>
 <CAFSsvmopSyRoAriDm-5yKuh4pJYEvBbe1HmaL8jsoC9AaaMjdA@mail.gmail.com>
Message-ID: <20191214220431.6c9e4fcf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Dec 2019 11:03:08 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> > SELinux can already be enabled on uClibc. I added the musl-fts package,
> > and used it in libselinux to make it available for uClibc/musl.
> >
> > When you're grumpy, please verify your claims :-)
>
> I'm aware of the option, but I don't agree with it. It's built into
> uClibc and requiring
> an extra package is not nice in my opinion.

The <fts.h> API is deprecated, and very few packages use it. It doesn't
make a lot of sense to force everybody to have it in uClibc, just for
the sake of a few packages.

Alternatively, we could add a separate option to enable FTS support in
uClibc when needed, but this stuff always gets annoying with uClibc
external toolchains that may or may not have FTS support enabled.

The musl-fts solution is easy. It works for musl, it works for uClibc,
regardless of the uClibc configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
