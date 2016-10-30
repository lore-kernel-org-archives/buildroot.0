From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 18:10:21 +0100
Subject: [Buildroot] [PATCH] binutils: add comment with bug report
 reference
In-Reply-To: <20161030161809.GG1797@waldemar-brodkorb.de>
References: <20161030132511.GA23794@waldemar-brodkorb.de>
 <20161030164340.6d8d079b@free-electrons.com>
 <20161030161809.GG1797@waldemar-brodkorb.de>
Message-ID: <20161030181021.04aa87c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:18:09 +0100, Waldemar Brodkorb wrote:

> > >  	config BR2_BINUTILS_VERSION_2_27_X
> > >  		bool "binutils 2.27"
> > >  		# supported but broken on Microblaze
> > > +		# see https://sourceware.org/bugzilla/show_bug.cgi?id=20748
> > >  		depends on !BR2_microblaze  
> > 
> > Your bug report is about binutils 2.27 generating broken binaries for
> > microblaze/musl, but you disable binutils 2.27 completely for
> > microblaze, and not just for musl. Why so?  
> 
> Because the binutils bug affects musl/uClibc-ng and glibc.
> I just used musl to bisect and simplified the bug report.
> Furthermore I normally get very good support from the musl devs
> in case of toolchain issues.

ACK, thanks for the explanation. But then perhaps your bug report
should be made more accurate? As it is written, one might understand
than it is a musl-specific problem. Knowing that uclibc-ng and glibc
are also affected is quite important IMO.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
