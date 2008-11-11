From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2008 13:31:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
In-Reply-To: <20081111114328.277F03C960@busybox.net>
References: <20081111114328.277F03C960@busybox.net>
Message-ID: <20081111133114.01a71f02@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 11 Nov 2008 03:43:28 -0800 (PST),
laird at uclibc.org a ?crit :

> package/tiff/tiff.mk: Change to Autotools.in format

Thanks for the conversion.

> +$(TIFF_HOOK_POST_BUILD):
> +	-cp -a $(TIFF_DIR)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/

In that case, Bernhard recommends using 'install' instead of 'cp'. I
must say I don't exactly know what would be the difference in that
specific case, though.

> +	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so

Probably missing a '*' at the end of libtiff.so. libtiff.so is probably
only a symlink (but I haven't checked).

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
