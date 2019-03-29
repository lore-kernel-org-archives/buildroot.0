From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 29 Mar 2019 22:11:13 +0000
Subject: [Buildroot] [PATCH] toolchain-external: Fix paths in libstdc++
 gdb python file
In-Reply-To: <20190329220445.22941-1-tpiepho@impinj.com>
References: <20190329220445.22941-1-tpiepho@impinj.com>
Message-ID: <1553897472.7410.66.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2019-03-29 at 22:04 +0000, Trent Piepho wrote:
> 
> This patch uses sed to fixup the paths to reflect the installed
> location, relative to HOST_DIR, and the location of the python module
> relative to HOST_DIR.
> 
> 
> +		-e "s:'($(TOOLCHAIN_EXTERNAL_ARM_ARM_PYTHON_DIR)):$(patsubst $(HOST_DIR)/%,/%,'$(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR))\1:" \
> 

There's a typo in this line that my test didn't catch because the file
was already fixed when I re-ran the install after making a small
change.

Should have the second single quote moved to the beginning of the
replacement text.


+		-e "s:'($(TOOLCHAIN_EXTERNAL_ARM_ARM_PYTHON_DIR)):'$(patsubst $(HOST_DIR)/%,/%,$(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR))\1:" \> 
