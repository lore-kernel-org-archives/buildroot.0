From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 16:25:10 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: added missing dependency
In-Reply-To: <1524060503-16067-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1524060503-16067-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180418162510.719ad915@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guillaume,

On Wed, 18 Apr 2018 16:08:23 +0200, Guillaume W. Bres wrote:

> +	depends on BR2_TOOLCHAIN_HAS_THREADS=y

Should be just depends on BR2_TOOLCHAIN_HAS_THREADS. You can look at
all the other packages to have examples on how to do things like that.

Also, please add in the commit log something like this:

"""
Fixes:

   http://autobuild.buildroot.org/results/...
"""

with an actual error to a build failure reported by the autobuilders.
The mention "22/46 toolchains have been successfully tested here." is
not useful because we don't know what "here" means, nor which
toolchains have been tested.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
