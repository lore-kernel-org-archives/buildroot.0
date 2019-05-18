From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:54:50 +0200
Subject: [Buildroot] [PATCH v2 01/13] package/openrc: new package
 (v0.41.2)
In-Reply-To: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
Message-ID: <20190518225450.5ec7231f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 May 2019 21:55:38 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> This adds openrc init system package. This performs default openrc
> installation with openrc-init that acts as pid1.
> 
> MKPKGCONFIG=no:
> openrc does not use pkg-config per se, if MKPKGCONFIG is enabled,
> it will just install *.pc files on rootfs for other programs to
> find librc and libeinfo. These libs expose C api to control openrc
> (al rc-* functions use it). From the looks of it, these libs would
> be usefull if user wanted to write his own programs to manage
> services, and vast majority of people using openrc won't need it.
> Also, that's the reason why there is not INSTALL_STAGING=yes.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v1 -> v2
>   Suggested by Thomas Petazzoni:
>   - new commit short message
>   - remove OPENRC_SOURCE (default is enough)
>   - remove += from first OPENRC_DEPENDENCIES
>   - use single OPENRC_MAKE_OPTS = (with line breaks)
>   - Remove TARGETDIR from make opts (leftover from different solution)
>   - Move conditional make opts below first OPENRC_MAKE_OPTS =
>   - move DESTDIR after OPENRC_MAKE_OPTS in OPENRC_INSTALL_TARGET_CMDS
>   - add links to sources and wiki in Config.in
>   - add hash for LICENSE file

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
