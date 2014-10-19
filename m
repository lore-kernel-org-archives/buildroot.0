From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:07:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] fs/iso9660: add dependencies for
 make source
In-Reply-To: <1413656639-3314-1-git-send-email-kaszak@gmail.com>
References: <1413656639-3314-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141019120708.6c44ece6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sat, 18 Oct 2014 20:23:59 +0200, Karoly Kasza wrote:
> The "iso image" rootfs target is a special one, as it does not use the
> ROOTFS_TARGET infrastructure. The absence of ROOTFS_*_DEPENDENCIES
> variable makes "make source" to skip this target's dependencies
> (namely host-cdrkit and it's children) obstructing an offline build.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Thanks applied. Two notes:

 * I've added a rootfs-iso9660-show-depends target, otherwise 'make
   graph-depends' was failing when iso9660 was selected.

 * The solution you've used, to add the ROOTFS_ISO9660_DEPENDENCIES
   really only works because of the way the main Makefile gets the
   dependencies for host packages. But as we've discussed in a separate
   way, this mechanism is broken, and should be replaced by a
   mechanism that relies on the package infrastructure. And when that
   will be done, iso9660 will break again. We should probably at some
   point figure out a way of getting the iso9660 support properly
   integrated as a normal filesystem type.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
