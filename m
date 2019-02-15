From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 15 Feb 2019 02:13:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-13
In-Reply-To: <20190214093947.3949384d@windsurf>
References: <20190214070044.6825F2152B@silver.osuosl.org>
 <20190214100244.GB15212@momiji> <20190214093947.3949384d@windsurf>
Message-ID: <20190215021300.GB25351@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Feb 2019 09:39:47 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Thu, 14 Feb 2019 10:02:44 +0200
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > On Thu, 14 Feb 2019 07:00:39 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > 
> > > [...]
> > >
> > > microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/1b6e6c5fddf3538ed7f150294c3d8fa94b3e4c59 |       
> > 
> > This seems to be the following upstream GCC bug:
> > 
> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78380
> > 
> > and likely related to this other one reported by Thomas:
> > 
> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401
> > 
> > Apparently GCC 8.x does not have the issue, so I wonder if it would make
> > sense to add a depends on BR2_TOOLCHAIN_GCC_AT_LEAST_{8 or 7} in the brotli
> > package when the target is Microblaze.
> 
> Did you verify that the issue is fixed with gcc 7.x or gcc 8.x ?

I tried both GCC 7.x and 8.x -- no luck, the internal compiler error is
still triggered when building Brotli :-\

> > Only woff2 need brotli (libcurl has an optional dependency), and woff2
> > itself is only used by WebKit for Web fonts, and if WOFF2 support is at
> > build time in WebKit the rest of Web fonts formats (WOFF1, TTF, etc.)
> > still work fine, so I think the disruption would be minimal.
> > 
> > Does the above sound reasonable to do?
> 
> Yes, if the issue no longer happens with gcc >= 7.x, it seems like a
> reasonable option.

At this point I don't know what to do; I don't see any proposed patch to
apply to GCC, and I never touched Microblaze before.

I guess disabling the Brotli package for Microblaze wouldn't be an option...
or would it?

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190215/31aa9d02/attachment.asc>
