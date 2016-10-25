From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 25 Oct 2016 13:21:23 +1100
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <20161024092546.21e4dc0f@free-electrons.com>
References: <20161019221035.2350c181@free-electrons.com>
 <20161024005421.GA2747@tungsten.ozlabs.ibm.com>
 <20161024092546.21e4dc0f@free-electrons.com>
Message-ID: <20161025022123.GB8599@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 24, 2016 at 09:25:46AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 24 Oct 2016 11:54:23 +1100, Sam Bobroff wrote:
> 
> > >  - Improving the developer experience when using _OVERRIDE_SRCDIR or
> > >    "local" packages. Currently, since the source code is copied in the
> > >    build directory, the build errors and warnings refers to the build
> > >    directory. That's not convenient for users running an IDE, since
> > >    clicking on the warning or error does not bring to the correct
> > >    file. After much discusion, it appears that the only reasonable
> > >    solution is to implement per-package out-of-tree build.  
> > 
> > Great! Will this allow the use of --delete with the rsync that copies the
> > source? (It would fix the problem caused by certain moved/renamed files in your
> > source directory when using _OVERRIDE_SOURCEDIR.)
> 
> Well, if we have per-package out-of-tree, then there is no rsync at all
> anymore. The source code stays in the directory specified in
> _OVERRIDE_SRCDIR, and only the build tree is in
> output/build/<pkg>-<version>/.

That is even better, from my point of view (as someone who uses buildroot as a
cross-compilation development environment) :-)

> However, this obviously works only for packages that use a sane build
> system supporting out of tree build.
> 
> Best regards,
> 
> Thomas

Cheers,
Sam.
