From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 20 Oct 2008 08:52:29 -0600
Subject: [Buildroot] Feedback ?
In-Reply-To: <20081020154814.060a5b95@surf>
References: <20081015164737.51a662cf@surf> <20081020154814.060a5b95@surf>
Message-ID: <20081020145229.GA10604@secretlab.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 20, 2008 at 03:48:14PM +0200, Thomas Petazzoni wrote:
> Le Wed, 15 Oct 2008 16:47:37 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> 
> > Make sure libraries are visible when building packages
> > 
> > This patch adds an LDFLAGS variable before calling the configure
> > script of any package, in order to fix two problems :
> > 
> >  * Some configure scripts were not able to compile the test programs
> >    used to test whether zlib was properly installed. The configure
> >    scripts are properly using -lz, but the
> >    -L/path/to/staging_dir/usr/lib option was not present, leading to
> >    build failure.
> > 
> >  * While linking applications, for example the applications included
> > in the fontconfig package, I had build failures like :
> > 
> > /usr/local/uclibc-0.9.28-2/arm/lib/gcc/arm-linux-uclibc/3.4.5/../../../../arm-linux-uclibc/bin/ld.real:
> > warning: libfreetype.so.6, needed by ../src/.libs/libfontconfig.so,
> > not found (try using -rpath or -rpath-link)
> > 
> >     this is due to the fact that ld is not able to find the other
> >     already installed shared libraries.
> 
> May I have some feedback on this patch ? Without this, Buildroot is
> just unusable here.

FWIW, this patch looks good to me, but I'm far from the most
knowledgable person to comment.

g.
