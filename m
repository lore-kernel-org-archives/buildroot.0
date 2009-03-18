From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2009 19:47:36 +0100
Subject: [Buildroot] On the usefulness of .la files and .pc files
In-Reply-To: <1237397085.6302.16.camel@sven>
References: <20090318174450.2641b85d@surf>
	<1237397085.6302.16.camel@sven>
Message-ID: <20090318194736.0974ecc6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sven,

Le Wed, 18 Mar 2009 18:24:45 +0100,
Sven Neumann <s.neumann@phase-zero.de> a ?crit :

> This tells libtool how to link a particular library.

What do you mean by ? link a particular library ? :

 1) How to create the library itself (i.e, the .so file)

 2) How to link an application or another library *against* the
    considered library ?

> This is mainly useful on platforms that need libraries to be
> explicitly linked.

By ? explicitly linked ?, you mean that when compiling library A, that
depends on B, which itself depends on C, you need to use -lB -lC, while
on Linux, giving -lB is enough ?

> On Linux this is actually not needed and you may safely remove those
> files.

So, why do we keep them and even patch them in Buildroot (see the
$(BUILD_DIR)/%/.stamp_staging_installed: rule in
package/Makefile.autotools.in). If the .la files are not patched (with
the modification of the libdir variable), then the link step of other
libraries or applications depending on the library fail. So the .la
files are clearly used.

> > Many libraries also install a .pc file in /usr/lib/pkgconfig/. It
> > also describe the dependencies, the library name, the flags to
> > compile new applications/libraries on top of the library, etc.
> 
> This gives hints on to compile stuff against the library. It is much
> more useful than the .la files as it allows to easily check for the
> presence of a library, it's version, dependencies and what compiler
> flags are needed.

Ok. This is understood.

Thanks for your clarification!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
