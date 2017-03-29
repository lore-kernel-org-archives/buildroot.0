From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 23:29:05 +0200
Subject: [Buildroot] [PATCH 1/4] system: do not overwrite /bin/sh
 Busybox symlink
In-Reply-To: <1490564623-26806-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490564623-26806-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170329232905.46689199@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 23:43:40 +0200, Thomas Petazzoni wrote:
> The BR2_SYSTEM_BIN_SH hidden option defines to what binary the /bin/sh
> symlinks should point to. If busybox is chosen, then /bin/sh is created
> to point to /bin/busybox.
> 
> This works fine with the default installation mode of Busybox, but it
> fails with the upcoming "individual binaries" mode, in which each applet
> is installed as its own binary, and /bin/busybox doesn't exist: we get
> /bin/sh as a broken symlink to /bin/busybox.
> 
> Since Busybox already installs its own /bin/sh symlink, properly
> pointing to /bin/ash or /bin/hush depending on the selected shell, it
> doesn't make sense for the BR2_SYSTEM_BIN_SH logic to override
> this. Just let Busybox install its own /bin/sh by making
> BR2_SYSTEM_BIN_SH empty when Busybox shell is selected as /bin/sh.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This is proposed as an alternative to
> https://patchwork.ozlabs.org/patch/686673/. If people believe
> https://patchwork.ozlabs.org/patch/686673/ is a better solution, I'm
> fine as well.
> ---
>  package/skeleton/skeleton.mk | 2 ++
>  system/Config.in             | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
