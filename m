From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:20:41 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: bump version to 10.15.3
In-Reply-To: <20190314133813.727-2-martin@barkynet.com>
References: <20190314133813.727-1-martin@barkynet.com>
 <20190314133813.727-2-martin@barkynet.com>
Message-ID: <20190315222041.4940f011@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Thu, 14 Mar 2019 13:38:11 +0000
Martin Bark <martin@barkynet.com> wrote:

> See https://nodejs.org/en/blog/release/v10.15.3/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

This commit log was really too terse, so I have extended it with some
explanation about the torque issue (hopefully I got it right).

Generally speaking, you have put too much information in the cover
letter, and too little in the commit log. The opposite is preferred,
because the commit logs stay forever in the Git history, and are much
more easily associated to a given change in a package, compared to a
cover letter than becomes buried deep down in the mailing list archives.

> +	$(INSTALL) -m755 -D $(@D)/out/Release/torque $(HOST_DIR)/usr/bin/torque

I changed to install to $(HOST_DIR)/bin/torque. We no longer have
$(HOST_DIR)/usr, it's a symlink to $(HOST_DIR).

> +	# use host version of torque
> +	sed "s#<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)#$(HOST_DIR)/usr/bin/torque#" \

And I changed it here as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
