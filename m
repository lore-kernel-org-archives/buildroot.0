From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 14:10:13 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/rhash: add host variant
In-Reply-To: <20201106202632.2424688-2-bernd.kuhls@t-online.de>
References: <20201106202632.2424688-1-bernd.kuhls@t-online.de>
 <20201106202632.2424688-2-bernd.kuhls@t-online.de>
Message-ID: <20201107141013.6c742223@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Nov 2020 21:26:32 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +		--extra-ldflags="$(HOST_LDFLAGS) -L $(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib" \

Well, HOST_LDFLAGS precisely contains

	-L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib

So this feels a bit redundant with what you're doing. Am I missing
something ?

>  $(eval $(generic-package))
> +$(eval $(host-autotools-package))

If the target variant if a generic-package, the host variant should
also be a host-generic-package.

Also, in general we don't really like to have "orphan" host packages.
Shouldn't this host package be added together with the support for sha3
hashes ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
