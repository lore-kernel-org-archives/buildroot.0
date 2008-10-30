From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 30 Oct 2008 10:52:50 +0100
Subject: [Buildroot] [PATCH 6/9] Ask the kernel source where it will
 installmodules
In-Reply-To: <20081016203246.15826.56394.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203246.15826.56394.stgit@localhost.localdomain>
Message-ID: <20081030105250.3ca61a3c@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Oct 2008 22:32:46 +0200
"Grant Likely" <grant.likely@secretlab.ca> wrote:

> From: Grant Likely <grant.likely@secretlab.ca>
> 
> Originally, $(LINUX26_VERSION) was used to figure out which directory
> modules would get installed in under /lib/modules.  This causes
> problems when $(LINUX26_VERSION) differs from what version the kernel
> source thinks it is using because it will try to use depmod in the
> wrong directory.
> 

I like this stuff, I'll give it a spin and see how it performs. If it
works well I'll add it to the repo (unless somebody beat me to it).

> This patch adds a new variable $(LINUX26_VERSION_MOD) which resolves
> to the exact version string that the kernel uses.  Module install
> then uses this value instead of $(LINUX26_VERSION) when running depmod
> 
> This patch also eliminates the modules.dep target and makes
> .modules_installed depend on $(LINUX26_DIR)/.configured directly.
> This is necessary because the value of $(LINUX26_VERSION_MOD) is
> unavailable before the kernel is unpacked.  Trying to use it in a
> target or dependency name confuses make.

And what about using the $(PROJECT_DIR)/autotools-stamp directory
instead for the depend file? Follow with the stream, etc... Easier to
know how to trigger a reinstall as well.

<snip patch>

-- 
Best regards,
Hans-Christian Egtvedt
