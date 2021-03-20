From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 23:02:11 +0100
Subject: [Buildroot] [PATCH v1] boot/syslinux: fix gcc-10.x compile
In-Reply-To: <20210307174753.9400-1-ps.report@gmx.net>
References: <20210307174753.9400-1-ps.report@gmx.net>
Message-ID: <20210320230211.32bb08c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Mar 2021 18:47:53 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add two patches ([1], [2]) taken from the fedora syslinux package ([3]) to fix
> compile/linking with gcc-10.x compiler.
> 
> [1] https://src.fedoraproject.org/rpms/syslinux/raw/rawhide/f/0005-Workaround-multiple-definition-of-symbol-errors.patch
> [2] https://src.fedoraproject.org/rpms/syslinux/raw/rawhide/f/0006-Replace-builtin-strlen-that-appears-to-get-optimized.patch
> [3] https://src.fedoraproject.org/rpms/syslinux/tree/rawhide
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>  - possible follow-up would be a buildroot syslinux package version
>    bump to upstream syslinux-6.04-pre4 (or git master), dropping
>    all current patches and importing all current fedora patches
>    instead (and/or check for duplicates)
>  - [4] and [5] advice to use 6.04-pre1 and avoid 6.04-pre2/6.04-pre3
>    and [6] to avoid 6.04-pre4
>  - not manny updates on the official git [7], but a wiki page
>    [8] mentioning various needed patches

Applied to master, thanks. The fixes that are needed and proposed are
quite scary... but the syslinux build system is, let's say, interesting.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
