From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 23:23:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/libglib2: Do not depend on
 util-linux
In-Reply-To: <CAJ4jsacyTaruLbozB0_uyRTKpw3Fd5N=H7Jyj0TJ8pRP9xpdFg@mail.gmail.com>
References: <20190916191605.86764-1-aduskett@gmail.com>
 <20190916191605.86764-2-aduskett@gmail.com>
 <20190917220216.3f719f37@windsurf>
 <CAJ4jsacyTaruLbozB0_uyRTKpw3Fd5N=H7Jyj0TJ8pRP9xpdFg@mail.gmail.com>
Message-ID: <20190917232327.2519c510@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Sep 2019 17:32:03 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > Applied to master, thanks. This may cause problems for people who
> > currently needed libmount, but do not have anything else in their
> > configuration that selects util-linux libmount option. Their next
> > Buildroot build will silently no longer have libmount support.
> >
> > However, we don't really have a good way to handle such dependencies
> > that used to be mandatory and become optional, so there's not much we
> > can do about it.
> >
> > We might however see a few build issues from reverse dependencies of
> > libglib2 that do need libmount. Such reverse dependencies will have to
> > select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT by themselves.  
> 
> Yet another candidate to depend on the impending util-linux-libs.

Indeed, but I don't see how util-linux-libs would have helped handling
"legacy" configurations in the transition from util-linux-libs being a
mandatory dependency to util-linux-libs becoming an optional
dependency. But I could be missing something here, it's getting late
for me.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
