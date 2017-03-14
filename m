From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:04:50 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-cmake: Use
 CMAKE_<LANG>_COMPILER_LAUNCHER for ccache
In-Reply-To: <d114f6b4-17cb-b833-a34c-34a0bedc498b@au1.ibm.com>
References: <20170309010911.1960-1-daniel.black@au.ibm.com>
 <20170309042720.or2hhr4zvgmrwcd2@tarshish>
 <20170309050752.19494-1-daniel.black@au.ibm.com>
 <22d614df-d3fd-93af-8ef2-c340f8b9e45f@mind.be>
 <d114f6b4-17cb-b833-a34c-34a0bedc498b@au1.ibm.com>
Message-ID: <20170314230450.329e7033@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 09:24:25 +1100, Daniel Black wrote:

> > On 09-03-17 06:07, Daniel Black wrote:  
> >> Since cmake version 3.4.0 CMAKE_<LANG>_COMPILER_LAUNCHER is used as
> >> the way to invoke things like ccache. We set this to ccache for
> >> the host and for cross compilers in toolchain.cmake.in. This
> >> leaves CMAKE_<C,CXX>_COMPILER pointing at the real compiler and
> >> still uses ccache.
> >>
> >> Update minimium dependency version in check-host-cmake.mk accordingly.  
> > 
> >  This is very unfortunate, it means a substantial slowdown in the build for
> > people who have an older system CMake.  
> 
> I didn't think it was that substantial for a one-off host package
> upgrade. I do realize it is a non-zero imposition for that installed
> cmake before it was updated to 3.4.0 in
> 7453c4bf6010b3a8dd794c39e327641abea15503 (Nov 13 2015).
> 
> >  Although it is indeed cleaner to handle ccache this way, I don't think it
> > really fixes anything, does it?  
> 
> Might fix some subtle build errors for packages that do odd things
> however no, there isn't an definite breakage I can point to.
> 
> > In that case, I think we should just stick with
> > the old way of doing things. We can revisit when we need to CMake 3.4 for some
> > other package.  
> 
> Works for me.

Thanks for your feedback, and to Arnout for reviewing the patch.
Following your discussion, I've marked the patch as "Rejected" in
patchwork.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
