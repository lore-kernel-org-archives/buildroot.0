From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 22:03:32 +0200
Subject: [Buildroot] [PATCH] docs/manual: clarify the reinstallation of
 a package
In-Reply-To: <20191016195444.2408065-1-vivien.didelot@gmail.com>
References: <20191016195444.2408065-1-vivien.didelot@gmail.com>
Message-ID: <20191021220332.16aaf3f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vivien,

On Wed, 16 Oct 2019 15:54:44 -0400
Vivien Didelot <vivien.didelot@gmail.com> wrote:

> Since <package>-rebuild implies <package>-reinstall and
> <package>-reconfigure implies <package>-rebuild, it is confusing
> to mention the make and make <package> commands when describing
> the restart of the configuration, compilation and installation of
> the package.
> 
> Therefore remove the ", followed by +make+ or +make <package>+"
> portions in the "8.3. Understanding how to rebuild packages" section,
> and add a new paragraph clarifying how to include the rebuilt package
> in the filesystem image, if that is necessary.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>

I've applied, after doing one adjustement, see below.

> +While +<package>-rebuild+ implies +<package>-reinstall+ and
> ++<package>-reconfigure+ implies +<package>-rebuild+, these targets as well
> +as +<package>+ only act on the said package, and do not trigger re-creating
> +the root filesystem image. If re-creating the root filesystem in necessary,
> +one should run +make+ or +make all+.

change the last line to:

one should in addition run +make+ or +make all+

just to make it clear that "make" or "make all" is not sufficient to
force the rebuild of a package: it should be in addition to using
<pkg>-rebuild.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
