From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:07:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups: add _PRE_CONFIGURE_HOOKS
 for proper autoconf
In-Reply-To: <1464543503-9057-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464543503-9057-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160612220737.69a84129@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 May 2016 19:38:23 +0200, Bernd Kuhls wrote:
> cups uses only autoconf, also using autoheader is broken:
> https://github.com/apple/cups/issues/4667#issuecomment-197689571
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> I wrote this patch while trying to fix
> http://autobuild.buildroot.net/results/70d/70d147fcac588610521974b8f7384e710a9a6d41/
> which would end up in a major rewrite of the build system, so I
> cancelled my attempt. Nonetheless I think we should have this patch
> so future patches to configure.in will be easier.
> 
>  ...01-Remove-man-from-BUILDDIRS-in-configure.patch | 27 ++++++++++------------
>  package/cups/cups.mk                               |  7 ++++++
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> index c0e87a4..af85ca8 100644
> --- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> +++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> @@ -1,21 +1,18 @@
> -From a77bb18a5584bb23687ed3c522dbd91a9987d5a7 Mon Sep 17 00:00:00 2001
> -From: Olivier Schonken <olivier.schonken@gmail.com>
> -Date: Wed, 20 Jan 2016 22:13:11 +0200
> -Subject: [PATCH] Remove man from BUILDDIRS in configure
> +From 6bc1d15250841cf17d307cfb4f35c960c23d8797 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 29 May 2016 19:31:50 +0200
> +Subject: [PATCH 1/1] Remove man from BUILDDIRS in configure

The 1/1 is not needed here, please generate patches using "git
format-patch -N".

Applied with this fixed!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
