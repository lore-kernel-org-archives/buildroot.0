From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 12:54:55 +0200
Subject: [Buildroot] [PATCH] New attempt to move $BUILD_DIR/.root
In-Reply-To: <1396366401-6534-1-git-send-email-jezz@sysmic.org>
References: <1396366401-6534-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141012125455.4025c179@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  1 Apr 2014 17:33:21 +0200, J?r?me Pouiller wrote:
> Since $STAMP_DIR does no more exist[1], I suggest to embed
> $BUILD_DIR/.root in a package infrastructure.
> 
> This patch add a special package called rootfs-dirs. Toolchain
> package was used as exemple for this work. rootfs-dirs package
> create and populate $TARGET_DIR and $STAGING_DIR.
> 
> [1] http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/79825
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I think I like the idea of moving the skeleton installation into a
package, but this patch mixes that with creating $(HOST_DIR) and some
subdirectories in $(STAGING_DIR).

Could you send a patch that only takes care of moving into a package
the installation of the skeleton? I.e, only take care of
$(BUILD_DIR)/.root itself, and not the $(STAGING_DIR) target.

This way, I believe you also don't need the $(2)_ADD_DIRS_DEPENDENCY
stuff, since this simplified package can have 'dirs' has a dependency.

Of course, all target packages should have this new 'skeleton' package
in their dependencies.

We'll mark your patch as Changes Requested in patchwork, awaiting for
your new updated version.

Of course, once the skeleton logic has been moved to a package, we can
see if some of the other Makefile logic can be reworked, but that
should be done separately.

Thanks,
 
Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
