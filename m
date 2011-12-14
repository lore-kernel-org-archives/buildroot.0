From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 15:29:21 +0100
Subject: [Buildroot] [PATCH 4 of 4 v3] dependencies: build a host-tar if
 no suitable tar can be found
In-Reply-To: <bc11accdafb5b8b0d945.1323862800@devws108>
References: <patchbomb.1323862796@devws108>
 <bc11accdafb5b8b0d945.1323862800@devws108>
Message-ID: <20111214152921.72ddc4b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 15:22:18 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> +HOST_TAR_EXTRACT_CMDS = \
> +	mkdir -p $(HOST_TAR_DIR) && cd $(HOST_TAR_DIR) && \
> +	$(INFLATE.gz) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i && \
> +	mv tar-$(TAR_VERSION)/* . && rmdir tar-$(TAR_VERSION)

I would prefer

define HOST_TAR_EXTRACT_CMDS
	...
endef

here.

I haven't checked the details, but I'm fine with the general approach.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
