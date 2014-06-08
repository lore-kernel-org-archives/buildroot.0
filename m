From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:22:41 +0200
Subject: [Buildroot] Patch to add Tilera tilegx platform support
In-Reply-To: <53906ED8.90500@arni.lv>
References: <53906ED8.90500@arni.lv>
Message-ID: <20140608172241.24672d2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arni,

On Thu, 05 Jun 2014 14:21:28 +0100, Arni wrote:

> I'm working on porting Tilera tilegx platform to OpenWRT project, but
> I'm sure you are also interested in it.
> Patch is very simple, hope someone will find it usefull. Here is the patch :

Thanks for this patch!

However, adding an architecture to Buildroot is a bit more than just
adding those few definitions. I'm mainly thinking:

 * Toolchain: did you test the internal toolchain backend? Or are
   external toolchains available?

 * Packages: how much user-space packages that have
   architecture-specific code support the tilegx platform? For example,
   libffi, or strace are such packages.

 * Support: if we start supporting a new architecture in Buildroot, we
   try to do it well. One aspect of this is that we would add this
   architecture to our automated build infrastructure, which tests
   random combinations of packages. Would you be willing to help fixing
   the issues that arise through this testing effort? It would be a bit
   annoying for us to add the support for an architecture, and then
   have nobody actively interested in it and therefore nobody fixing
   the various issues.

On a more anecdotal note, your Git commit is improperly formatted,
because your commit log contains some contents not relevant for a
commit log. It should look like just:

"""
Add support for Tilera tilegx architecture

This commit adds support for the tilegx CPU architecture designed by
Tilera.

Signed-off-by: You <you@domain.com>
"""

See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for details.


Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
