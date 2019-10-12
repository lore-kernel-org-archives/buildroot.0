From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 16:16:58 +0200
Subject: [Buildroot] [PATCH] configs/minnowboard_max-graphical: fix
 build due to missing glxproto.h
In-Reply-To: <20191012135105.26722-1-unixmania@gmail.com>
References: <20191012135105.26722-1-unixmania@gmail.com>
Message-ID: <20191012161658.15f8c0fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Sat, 12 Oct 2019 10:51:05 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Commit 5cb821d5635 added a new option to enable GLX support in mesa3d.
> Update the defconfig accordingly.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/318105208
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> The defconfig was edited by hand to reduce the turmoild that would
> result from using "make savedefconfig"

Fixing the defconfig is not the way to go: if a given configuration
causes a build failure, then Buildroot needs to be fixed, as it means
that the mesa3d package itself is broken: it lets users create
configurations that fail to build.

For example, it means the random configuration testing from the
autobuilders could still fall into this build failure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
