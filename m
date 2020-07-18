From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:56:24 +0200
Subject: [Buildroot] [PATCH] package/host-e2fsprogs: explicitly do not
 install udev and systemd files
In-Reply-To: <20200717120654.548833-1-antoine.tenart@bootlin.com>
References: <20200717120654.548833-1-antoine.tenart@bootlin.com>
Message-ID: <20200718155624.00f44c7e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jul 2020 14:06:54 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> Explicitly do not install udev rules and systemd units when installing
> the host version of e2fsprogs, as we do not need those files when
> calling host tools provided by e2fsprogs from Buildroot.
> 
> This fixes a weird issue I encountered: host-e2fsprogs was built and
> installed without any issue when building an image from scratch. But any
> attempt to rebuild host-e2fsprogs alone was failing during the
> installation steps as it tried to install files to the host system.
> 
> This is because e2fsprogs' build system (autotools) is using the prefix
> given at configuration time when installing its binaries, configuration
> files, man pages, etc... but not when installing its systemd units and
> udev rules.
> 
> The issue did not arise when building it from scratch, as host-e2fsprogs
> do not have a dependency on host-udev/systemd, so its configure script
> did not automatically enable udev/systemd installation steps at first.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
