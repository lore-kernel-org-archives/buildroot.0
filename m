From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Oct 2009 10:44:24 +0200
Subject: [Buildroot] how to clean up everything but the toolchain
In-Reply-To: <1254384273.5284.5.camel@sven>
References: <1254384273.5284.5.camel@sven>
Message-ID: <20091001104424.4955b8a2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 01 Oct 2009 10:04:33 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> we are using buildroot to build a number of projects for the same
> platform. Currently we do this simply by changing the .config file. In
> order for the build to work after changing the .config file, we remove
> the project_build_arm, build_arm and toolchain_build_arm directories.
> So basically we are doing a full rebuild, including the toolchain. We
> could save a lot of CPU cycles if we could reuse the toolchain build.
> However I found that if I remove the build_arm directory, but not the
> toolchain_build_arm directory, things will break. So I wonder if there
> is an easy solution to this. Perhaps a make target that we didn't
> discover yet?

This is something we should definitely support, but I'm not sure yet
how to achieve that. At least of the mandatory component is to be able
to cleanly remove packages from the staging/ and target/ directories.
And this requires a global infrastructure used by all packages (like
Makefile.autotools.in, but more generic). I've started working on this,
but it will take some time (fairly complex + limited free time).

However, what I'm doing currently is that I use external toolchains
(that's the reason for which I improved a little the external toolchain
support in Buildroot). Toolchain is generated once for all with
Crosstool-ng, and then Buildroot is only used to build the root
filesystem.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
