From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Dec 2008 23:42:34 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081215220738.6F7173C6BA@busybox.net>
References: <20081215220738.6F7173C6BA@busybox.net>
Message-ID: <20081215234234.575aca77@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 15 Dec 2008 14:07:38 -0800 (PST),
tpetazzoni at uclibc.org a ?crit :

> TARGET_PATH didn't contain $(STAGING_DIR)/usr/bin, which means that
> programs installed in $(STAGING_DIR)/usr/bin were not considered for
> execution during Buildroot build process. This was a problem with host
> automake/autoconf/libtool, which could not be found.

BTW, I'm quite confused by the fact that we install host binaries and
target binaries in $(STAGING_DIR). It means that during the build, we
have target binaries considered for execution because they are in
$(STAGING_DIR)/usr/bin, which is the the PATH during Buildroot
execution.

Is there any reason for this ?

I would really find it cleaner to have a separate installation
directory for host tools (like toolchain_build_ARCH/bin which contains
a symlink to sed).

What do you think ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
