From: =?UTF-8?Q?Mika=c3=abl_BOURHIS-CLOAREC?= <mikael.bourhis@smile.fr>
Date: Thu, 12 Mar 2020 13:54:08 +0100
Subject: [Buildroot] [PATCH v3 2/4] package/connman: bump to 1.38
In-Reply-To: <20200227232955.16610-2-petr.vorel@gmail.com>
References: <20200227232955.16610-1-petr.vorel@gmail.com>
 <20200227232955.16610-2-petr.vorel@gmail.com>
Message-ID: <a507f586-b9a2-364d-526e-c45b4303371a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 28/02/2020 00:29, Petr Vorel wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>   package/connman/connman.hash | 2 +-
>   package/connman/connman.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/connman/connman.hash b/package/connman/connman.hash
> index ff5b4d48f0..3039105027 100644
> --- a/package/connman/connman.hash
> +++ b/package/connman/connman.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
> -sha256 6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16  connman-1.37.tar.xz
> +sha256 cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b  connman-1.38.tar.xz
>   # Locally computed
>   sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 8403237c28..7ea52f012a 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONNMAN_VERSION = 1.37
> +CONNMAN_VERSION = 1.38
The default build configuration of connman 1.38 uses 'WireGuard' and 
'libmnl'.
The current autobuild is broken due to the missing 'libmnl' dependency [1].
A set of patches is already suggested [2] but,
the best way could be a default 'connman' configuration with 'WireGuard' 
disabled,
before the adding of WireGuard support,

('CONNMAN_CONF_OPTS += --disable-wireguard' in 'package/connman/connman.mk')

so the default build of connman will be ok,
and then, complete the patch.
>   CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
>   CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
>   CONNMAN_DEPENDENCIES = libglib2 dbus iptables
[1] 
http://autobuild.buildroot.org/results/e66/e66c83d0a9d0f3710907b6f7358d92b69b9e297d/build-end.log
[2] http://patchwork.ozlabs.org/patch/1250994/


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200312/1aae888c/attachment.html>
