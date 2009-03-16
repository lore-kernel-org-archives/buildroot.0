From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2009 20:08:49 +0100
Subject: [Buildroot] svn commit: [25683] trunk/buildroot: package project
In-Reply-To: <20090316154844.13B657643C@busybox.osuosl.org>
References: <20090316154844.13B657643C@busybox.osuosl.org>
Message-ID: <20090316200849.2beaada3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Mar 2009 15:48:44 +0000 (UTC),
jacmet at uclibc.org a ?crit :

> -		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)"
> +		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
> +		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
> +             PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"

I haven't read the whole patch in its context, but from a quick look, I
would I've written:

 PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig/:$(PKG_CONFIG_PATH)"

since the pkg-config binary compiled by Buildroot should probably be
installed in $(HOST_DIR) (since it's a host binary) and the .pc files
for the target architecture are installed in
$(STAGING_DIR)/usr/lib/pkgconfig.

Again, I might completely wrong.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
