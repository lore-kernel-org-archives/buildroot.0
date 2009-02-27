From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Feb 2009 22:30:49 +0100
Subject: [Buildroot] I want to know how the buildroot works inside when
 build and install a new package
In-Reply-To: <2ae8403e0902261945w682609fbwa4758e1bcf01f742@mail.gmail.com>
References: <2ae8403e0902261945w682609fbwa4758e1bcf01f742@mail.gmail.com>
Message-ID: <20090227223049.4cb8362a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le Fri, 27 Feb 2009 11:45:55 +0800,
IaMaPlAyEr <iamaplayer@gmail.com> a ?crit :

> And how the buildroot works inside?

Most of the autotools-based packages are released with the configure
script and Makefile.in files already generated (i.e, aclocal, autoconf,
autoheader and automake have been run by the developer and integrated
inside the released tarball). So, the automagic thing available in
Buildroot to compile autotools-based packages will basically do :

 ./configure
 make
 make install

(passing of course the correct options and setting the appropriate
environment variables to get cross-compilation to work properly).

However, if for some reason you want the whole aclocal, autoconf,
autoheader and automake process to be run before compiling the package,
you can add :

FOO_AUTORECONF=YES

in your Buildroot Makefile. This is particularly useful if you patch
the configure.in file or the Makefile.am files.

Does that answer your question ? If not, don't hesitate to ask for
details.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
