From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 12 Jan 2019 10:44:41 +0100
Subject: [Buildroot] [PATCH v1] libinput: drop C++ dependency
In-Reply-To: <20190112073321.GE2428@scaer>
References: <20190111230158.5283-1-ps.report@gmx.net>
 <20190112073321.GE2428@scaer>
Message-ID: <20190112104441.370c8423@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 12 Jan 2019 08:33:21 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
> 
> On 2019-01-12 00:01 +0100, Peter Seiderer spake thusly:
> > The meson C++ dependency is only used for a build-time header
> > include test, so drop both.  
> [--SNIP--]
> > [1] http://autobuild.buildroot.net/results/bf4d3d360f6Drop hard meson C++/CPP dependency35c3524a52b84a72d558770596ed0
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Note:
> >   - alternative solution would be to add a c++ dependency for libinput
> >   - patch could be improved to optional C++ dependency/compile (but did
> >     not know how to express this in meson)  
> [--SNIP--]
> > +@@ -641,12 +641,6 @@ executable('test-build-linker',
> > + 	   include_directories : [includes_src, includes_include],
> > + 	   dependencies : [ dep_libinput, dep_libinput_util ],
> > + 	   install : false)
> > +-# test including from C++
> > +-executable('test-build-cxx',
> > +-	   'test/build-cxx.cc',
> > +-	   dependencies : [dep_udev],
> > +-	   include_directories : [includes_src, includes_include],
> > +-	   install : false)  
> 
> You may want to test something like that:
> 
>     if add_languages('cpp')
>         executable('test-build-cxx',
>             blablabla)
>     endif

Thanks for the hint, works with:

	if add_languages('cpp', required: false)

Updated patch is on the way....

Regards,
Peter

> 
> If that works, then I think I'd prefer we use this patch, because it is
> upstreamable, which you should try to do btw.
> 
> Regards,
> Yann E. MORIN.
> 
> > + # This is the test suite runner, we allow disabling that one because of
> > + # dependencies
> > +-- 
> > +2.20.1
> > +
> > -- 
> > 2.20.1
> >   
> 
