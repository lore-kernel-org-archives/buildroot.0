From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 23:27:41 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
In-Reply-To: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140701232741.2059539a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sun, 29 Jun 2014 21:35:37 +0200, Eric Le Bihan wrote:
> This patch bumps systemd to version 214.
> 
> Changes:
> 
> - add new users: systemd-bus-proxy, systemd-network and systemd-resolve.
> - remove gtk-doc patch, as it is no longer needed.
> - force kmod path when configuring.
> - remove attr build dependency.
> 
> Besides:
> 
> - /var/lock no longer needs to be a symlink to /run, as systemd, via
>   tmpfiles.d, will automatically create a symlink to /run/lock at
>   runtime.
> - when using systemd-networkd, /etc/resolv.conf should now be a symlink
>   to /run/systemd/resolve/resolv.conf.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...ystemd-03-fix-am-path-libgcrypt-no-found.patch} |  0
>  package/systemd/systemd-03-fix-no-gtk-doc.patch    | 23 ----------------------
>  package/systemd/systemd.mk                         | 11 +++++++++--
>  3 files changed, 9 insertions(+), 25 deletions(-)
>  rename package/systemd/{systemd-04-fix-am-path-libgcrypt-no-found.patch => systemd-03-fix-am-path-libgcrypt-no-found.patch} (100%)
>  delete mode 100644 package/systemd/systemd-03-fix-no-gtk-doc.patch

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(I don't know much about systemd, but the changes look good to me, and
I trust Eric when it comes to systemd stuff and I know he'll be around
to fix stuff if bad things happen.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
