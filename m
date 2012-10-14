From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 10:35:18 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121014103518.4fb1089d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 14 Oct 2012 01:13:45 +0200, Arnout Vandecappelle
\(Essensium/Mind\) wrote:
>  Many buildroot users prefer to keep their project's customizations
> separate from buildroot itself.  This makes it easier to go to a
> new buildroot version, and to identify which parts are project-
> specific.  Although it was already possible to keep the project's
> customization separate, this patch set simplifies it.
> 
>  It introduces a new config option, BR2_PROJECT_DIR (patch 1).
> This symbol is used to set defaults for many other config options
> (patches 2-7). The buildroot config itself can also be stored in
> the project directory by setting a default BR2_DEFCONFIG (patch 8).
> 
>  Patch 9 does a 'make defconfig' and 'make world' in a single run
> when a project directory is available.
> 
>  Patch 10 makes it possible to update all config files (buildroot,
> linux, busybox, ...) in a single shot.
> 
>  Patch 11 adds a 'make projectdir' target to initialize a project
> directory.  It also creates a Makefile in the project directory:
> it downloads buildroot itself, so the project directory is
> self-sufficient.
> 
>  Patch 12 adds the thing that everybody has to put in their
> post-build script as a configuration option: a rootfs overlay.
> This patch could also be applied independent of the series
> (except for the one line that sets a default based on PROJECT_DIR).

I agree about this one.

>  Patch 13, finally, adds the PROJECT_DIR concept to the manual.

I'll have a close look at all this later, but for reference, this is
almost exactly a feature that Buildroot had years ago, and that we
painfully progressively removed because it was not used properly by
anyone, and was crippling the code base and usage of Buildroot with a
lot of useless complexity.

So I'll have a look, but my initial impression is one of fairly high
skepticism, to say the least.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
