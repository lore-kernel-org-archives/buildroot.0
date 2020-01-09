From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 18:00:32 +0100
Subject: [Buildroot] [PATCH v2 0/2] package/wireguard upgrade
In-Reply-To: <20200109091620.21008-1-peter@korsgaard.com>
References: <20200109091620.21008-1-peter@korsgaard.com>
Message-ID: <20200109170032.GL17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-01-09 10:16 +0100, Peter Korsgaard spake thusly:
> With the kernel support for WireGuard getting mainlined, the upstream repo
> has been split in a wireguard-tools repo for the userspace tooling and
> wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).
> 
> This series renames the wireguard package to wireguard-tools for the
> userspace tooling and adds a package for wireguard-linux-compat.

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> Changes since v1:
> - Rename the userspace package to wireguard-tools and add
>   Config.in.legacy handling as suggested by Yann
> 
> Peter Korsgaard (2):
>   package/wireguard: change to the wireguard-tools package
>   package/wireguard-linux-compat: new package
> 
>  Config.in.legacy                              | 11 +++++
>  DEVELOPERS                                    |  3 +-
>  package/Config.in                             |  3 +-
>  package/wireguard-linux-compat/Config.in      | 23 +++++++++++
>  .../wireguard-linux-compat.hash               |  4 ++
>  .../wireguard-linux-compat.mk                 | 15 +++++++
>  .../{wireguard => wireguard-tools}/Config.in  | 15 ++++---
>  package/wireguard-tools/wireguard-tools.hash  |  4 ++
>  package/wireguard-tools/wireguard-tools.mk    | 36 ++++++++++++++++
>  package/wireguard/wireguard.hash              |  4 --
>  package/wireguard/wireguard.mk                | 41 -------------------
>  11 files changed, 104 insertions(+), 55 deletions(-)
>  create mode 100644 package/wireguard-linux-compat/Config.in
>  create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.hash
>  create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.mk
>  rename package/{wireguard => wireguard-tools}/Config.in (63%)
>  create mode 100644 package/wireguard-tools/wireguard-tools.hash
>  create mode 100644 package/wireguard-tools/wireguard-tools.mk
>  delete mode 100644 package/wireguard/wireguard.hash
>  delete mode 100644 package/wireguard/wireguard.mk
> 
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
