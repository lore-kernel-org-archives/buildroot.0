From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2008 17:39:47 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C92005@mi8nycmail19.Mi8.com>
References: <20081106125430.01B343C758@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C92005@mi8nycmail19.Mi8.com>
Message-ID: <20081106173947.7e8aeea4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 6 Nov 2008 10:54:56 -0500,
"hartleys" <hartleys@visionengravers.com> a ?crit :

> Just updated to revision 23943. The patch looked liked it would fix
> the issues I have with compiling mtd. But, no good I still get errors.

> In order to get mtd to build correctly I have to patch mtd.mk as
> follows:
> 
> $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
> 	mkdir -p $(TARGET_DIR)/usr/sbin
> 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include
> -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> 		BUILDDIR=$(MTD_DIR) \
> 		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)
> LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)

The modification made by Daniel Laird concerns TARGET_CONFIGURE_OPTS, a
variable used in *.mk files of packages relying on the
classical ./configure machinery.

For mtd, there's no such ./configure machinery, so adaptations to make
the package buildable with an external toolchain must be made directly
to the .mk file, with a patch like the one you proposed.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
