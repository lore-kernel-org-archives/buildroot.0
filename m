From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 30 Oct 2016 17:18:09 +0100
Subject: [Buildroot] [PATCH] binutils: add comment with bug report
 reference
In-Reply-To: <20161030164340.6d8d079b@free-electrons.com>
References: <20161030132511.GA23794@waldemar-brodkorb.de>
 <20161030164340.6d8d079b@free-electrons.com>
Message-ID: <20161030161809.GG1797@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 30 Oct 2016 14:25:11 +0100, Waldemar Brodkorb wrote:
> > Add requested bug report
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/binutils/Config.in.host | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> > index a7610b4..dce6996 100644
> > --- a/package/binutils/Config.in.host
> > +++ b/package/binutils/Config.in.host
> > @@ -18,6 +18,7 @@ choice
> >  	config BR2_BINUTILS_VERSION_2_27_X
> >  		bool "binutils 2.27"
> >  		# supported but broken on Microblaze
> > +		# see https://sourceware.org/bugzilla/show_bug.cgi?id=20748
> >  		depends on !BR2_microblaze
> 
> Your bug report is about binutils 2.27 generating broken binaries for
> microblaze/musl, but you disable binutils 2.27 completely for
> microblaze, and not just for musl. Why so?

Because the binutils bug affects musl/uClibc-ng and glibc.
I just used musl to bisect and simplified the bug report.
Furthermore I normally get very good support from the musl devs
in case of toolchain issues.

best regards
 Waldemar
