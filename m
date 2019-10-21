From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Mon, 21 Oct 2019 16:13:32 -0400
Subject: [Buildroot] [PATCH] docs/manual: clarify the reinstallation of
 a package
In-Reply-To: <20191021220332.16aaf3f3@windsurf>
References: <20191016195444.2408065-1-vivien.didelot@gmail.com>
 <20191021220332.16aaf3f3@windsurf>
Message-ID: <20191021161332.GB107668@t480s.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 21 Oct 2019 22:03:32 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > Since <package>-rebuild implies <package>-reinstall and
> > <package>-reconfigure implies <package>-rebuild, it is confusing
> > to mention the make and make <package> commands when describing
> > the restart of the configuration, compilation and installation of
> > the package.
> > 
> > Therefore remove the ", followed by +make+ or +make <package>+"
> > portions in the "8.3. Understanding how to rebuild packages" section,
> > and add a new paragraph clarifying how to include the rebuilt package
> > in the filesystem image, if that is necessary.
> > 
> > Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
> 
> I've applied, after doing one adjustement, see below.
> 
> > +While +<package>-rebuild+ implies +<package>-reinstall+ and
> > ++<package>-reconfigure+ implies +<package>-rebuild+, these targets as well
> > +as +<package>+ only act on the said package, and do not trigger re-creating
> > +the root filesystem image. If re-creating the root filesystem in necessary,
> > +one should run +make+ or +make all+.
> 
> change the last line to:
> 
> one should in addition run +make+ or +make all+
> 
> just to make it clear that "make" or "make all" is not sufficient to
> force the rebuild of a package: it should be in addition to using
> <pkg>-rebuild.

Much better indeed, thanks!
