From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 15 Nov 2016 12:35:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/netsniff-ng: allow to build
 with musl
In-Reply-To: <20161115113946.556c143b@free-electrons.com>
References: <20161114112948.13292-1-tklauser@distanz.ch>
 <20161114112948.13292-3-tklauser@distanz.ch>
 <20161115113946.556c143b@free-electrons.com>
Message-ID: <20161115113544.GB3373@distanz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-15 at 11:39:46 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
> 
> On Mon, 14 Nov 2016 12:29:48 +0100, Tobias Klauser wrote:
> > netsniff-ng allows build with musl since version 0.5.8. With libnet now
> > being able to build with musl, let's enable musl for netsniff-ng as
> > well.
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  package/netsniff-ng/Config.in | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> > index e52bb25f0acd..dca016469736 100644
> > --- a/package/netsniff-ng/Config.in
> > +++ b/package/netsniff-ng/Config.in
> > @@ -7,8 +7,7 @@ config BR2_PACKAGE_NETSNIFF_NG
> >  	select BR2_PACKAGE_LIBURCU
> >  	select BR2_PACKAGE_LIBNET
> >  	# Build with uClibc fails due to missing ceill()
> > -	# Build with musl fails due to various header issues
> > -	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> 
> This is good, but you forgot to update the Config.in comment that shows
> the dependencies needed for this package. So I've fixed that and
> applied to next. Thanks!

Thanks for fixing it up!
