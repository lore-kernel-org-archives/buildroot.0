From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 10:31:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to
 version 2.66.8
In-Reply-To: <20210321131508.1141933-1-fontaine.fabrice@gmail.com>
References: <20210321131508.1141933-1-fontaine.fabrice@gmail.com>
Message-ID: <20210328083152.GN24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-21 14:15 +0100, Fabrice Fontaine spake thusly:
> Fix a security issue when using g_file_replace() with
> G_FILE_CREATE_REPLACE_DESTINATION
> 
> https://gitlab.gnome.org/GNOME/glib/-/tags/2.66.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
>  package/libglib2/libglib2.hash                     | 4 ++--
>  package/libglib2/libglib2.mk                       | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
> index 25cb23c239..11978e9755 100644
> --- a/package/libglib2/0003-remove-cpp-requirement.patch
> +++ b/package/libglib2/0003-remove-cpp-requirement.patch
> @@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
>  @@ -1,4 +1,4 @@
>  -project('glib', 'c', 'cpp',
>  +project('glib', 'c',
> -   version : '2.66.7',
> +   version : '2.66.8',
>     # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>     meson_version : '>= 0.49.2',
>  @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 7886bb5c59..4f69f1cc48 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.66/glib-2.66.7.sha256sum
> -sha256  09f158769f6f26b31074e15b1ac80ec39b13b53102dfae66cfe826fb2cc65502  glib-2.66.7.tar.xz
> +# https://download.gnome.org/sources/glib/2.66/glib-2.66.8.sha256sum
> +sha256  97bc87dd91365589af5cbbfea2574833aea7a1b71840fd365ecd2852c76b9c8b  glib-2.66.8.tar.xz
>  # License files, locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index ffbb4c96b5..9ce40d91ff 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBGLIB2_VERSION_MAJOR = 2.66
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).7
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).8
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> -- 
> 2.30.1
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
