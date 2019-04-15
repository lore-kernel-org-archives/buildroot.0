From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 22:42:45 +0200
Subject: [Buildroot] [PATCH v2] package/mpd: bump to version 0.21.7
In-Reply-To: <20190415203618.7598-1-joerg.krause@embedded.rocks>
References: <20190415203618.7598-1-joerg.krause@embedded.rocks>
Message-ID: <20190415224245.787eee35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

On Mon, 15 Apr 2019 22:36:18 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> The Meson build system detects the `libgcrypt-config` program by looking for the
> corresponding entry in the cross file and falls back to searching PATH. As we
> do not want creeping libgcrypt-config into the global cross-file and the
> current Meson version 0.49 does not offer us any other way to pass the
> libgcrypt-config entry to the configuration step, we are forced to pass it
> through PATH.
> 
> To prevent detecting the hosts libgcrypt-config program, we force detecting
> the program installed in staging by passing the staging dir early in PATH.

Except it is not a wise idea at all to add $(STAGING_DIR)/usr/bin to
PATH, because $(STAGING_DIR)/usr/bin contains binaries compiled for the
target. For example, if Python has been built, then "python" will be in
$(STAGING_DIR)/usr/bin, and because you put $(STAGING_DIR)/usr/bin in
front of everything else, the target-built python will be used during
the build process. Not good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
