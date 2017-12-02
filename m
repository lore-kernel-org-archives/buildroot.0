From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 21:13:40 +0100
Subject: [Buildroot] [RFCv3 09/15] package/pkg-generic: handle host-lzip
 as an extract dependency
In-Reply-To: <20171202151224.GE2988@scaer>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-10-thomas.petazzoni@free-electrons.com>
 <20171202151224.GE2988@scaer>
Message-ID: <20171202211340.531d3dc8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Dec 2017 16:12:24 +0100, Yann E. MORIN wrote:

> > To achieve that, check-host-xz.mk fills in the
> > BR2_LZIP_HOST_DEPENDENCY with host-tar if building a host-tar is
> > needed. The name BR2_LZIP_HOST_DEPENDENCY has been chosen because it
> > matches the name BR2_CMAKE_HOST_DEPENDENCY already used in
> > check-host-cmake.mk.
> > 
> > The BR2_LZIP_HOST_DEPENDENCY is added to all packages, except:  
> 
> So even when no package compresed with lzip is enabled?
> 
> That was a gripe of yours, that host-lzip was always built even when not
> needed...

This problem already exists today, and my series does not aim at fixing
it. Fixing it is a separate problem, that I didn't want to solve in the
same series (which as you can see is already growing significantly in
terms of number of patches).

So, it is intentional that I do not solve this specific problem as part
of this series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
