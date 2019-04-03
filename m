From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 3 Apr 2019 08:23:38 +0200
Subject: [Buildroot] [PATCH] package/luajit: bump to version 2.1.x
 developpment version
In-Reply-To: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <CAB0FRsuSHstYRVddnG3x=_u4_8WrSf0ZjsWkB7gY=fnVfdUr7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 2 avr. 2019 ? 16:49, Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
a ?crit :

> In order to integrate bcc (front end tool for eBPF) into buildroot
> and testing it on a Raspberry PI 3; We need to upgrade the version
> of luajit to 2.1.0 to support aarch64.
>
> Currently, luajit aarch64_be support has not been tested.
>
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/Config.in   | 2 +-
>  package/luajit/luajit.hash | 4 ++--
>  package/luajit/luajit.mk   | 5 ++---
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 88c5bcb..9ecf6b4 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>         bool
> -       default y if BR2_i386 || \
> +       default y if BR2_i386 || BR2_aarch64 || \
>                 (BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
>                 BR2_powerpc || BR2_arm || BR2_armeb || \
>                 ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
> diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
> index 2081d12..b422bc9 100644
> --- a/package/luajit/luajit.hash
> +++ b/package/luajit/luajit.hash
> @@ -1,2 +1,2 @@
> -# Hashes from: http://luajit.org/download.html
> -md5 48353202cbcacab84ee41a5a70ea0a2c    LuaJIT-2.0.5.tar.gz
> +# Localy generated
> +sha256 ad5077bd861241bf5e50ae4bf543d291c5fcffab95ccc3218401131f503e45bd
> luajit-f0e865dd4861520258299d0f2a56491bd9d602e1.tar.gz
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 5b08a42..9a06691 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -4,9 +4,8 @@
>  #
>
>  ################################################################################
>
> -LUAJIT_VERSION = 2.0.5
> -LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
> -LUAJIT_SITE = http://luajit.org/download
> +LUAJIT_VERSION = f0e865dd4861520258299d0f2a56491bd9d602e1
>

Could you use the version 2.1.0-beta3 which is available (with its hash) on
http://luajit.org/download.html ?

Fran?ois

+LUAJIT_SITE = $(call github,luajit,luajit,$(LUAJIT_VERSION))
>  LUAJIT_LICENSE = MIT
>  LUAJIT_LICENSE_FILES = COPYRIGHT
>
> --
> 2.7.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190403/0a6cef5e/attachment-0001.html>
