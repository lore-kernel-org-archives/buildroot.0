From: Brunelle, Maxime <mbrunelle@distech-controls.com>
Date: Mon, 23 Nov 2020 21:27:07 +0000
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.65.3
In-Reply-To: <CAPi7W80A-gQ=U=-_RTwbrJCCObqfZCWLSAe0YuEg++XbcqG2hw@mail.gmail.com>
References: <20201123200420.764354-1-mbrunelle@distech-controls.com>,
 <CAPi7W80A-gQ=U=-_RTwbrJCCObqfZCWLSAe0YuEg++XbcqG2hw@mail.gmail.com>
Message-ID: <SN2PR01MB21924F146F71E46C1C07F4E98EFC0@SN2PR01MB2192.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Version 2.64.6 doesn't have the fix for the segmentation fault I'm seeing with NetworkManager, so I'll produce a new patch for 2.66.3 instead.

Thank you and best regards,

Maxime

________________________________
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Sent: November 23, 2020 15:50
To: Brunelle, Maxime <mbrunelle@distech-controls.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Subject: Re: [PATCH 1/1] package/libglib2: bump version to 2.65.3

Hi Maxime,

Le lun. 23 nov. 2020 ? 21:06, Maxime Brunelle
<mbrunelle@distech-controls.com> a ?crit :
>
> Fixes https://urldefense.com/v3/__https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/524__;!!Po4YltK3bPMkYw!hzblQjKv7RMImOmwCxe7wq87L3Y21sU-E4KMU5OJhiFinOtqOuleOjgOslmygCMOnU8ijpnf$
> package/libglib2 reference: https://urldefense.com/v3/__https://gitlab.gnome.org/GNOME/glib/-/issues/2091__;!!Po4YltK3bPMkYw!hzblQjKv7RMImOmwCxe7wq87L3Y21sU-E4KMU5OJhiFinOtqOuleOjgOslmygCMOnYpoCEes$
>
> Signed-off-by: Maxime Brunelle <mbrunelle@distech-controls.com>
> ---
>  package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
>  package/libglib2/libglib2.hash                     | 4 ++--
>  package/libglib2/libglib2.mk                       | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
> index 7e447a9efc..d19aa34616 100644
> --- a/package/libglib2/0003-remove-cpp-requirement.patch
> +++ b/package/libglib2/0003-remove-cpp-requirement.patch
> @@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
>  @@ -1,4 +1,4 @@
>  -project('glib', 'c', 'cpp',
>  +project('glib', 'c',
> -   version : '2.64.4',
> +   version : '2.65.3',
2.65.x serie is a development serie, it would be better to bump to
2.64.6 or 2.66.x serie.
>     # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>     meson_version : '>= 0.49.2',
>  @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 55f0bb1678..41bf39435c 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://urldefense.com/v3/__https://download.gnome.org/sources/glib/2.64/glib-2.64.4.sha256sum__;!!Po4YltK3bPMkYw!hzblQjKv7RMImOmwCxe7wq87L3Y21sU-E4KMU5OJhiFinOtqOuleOjgOslmygCMOnQhV0LSP$
> -sha256  f7e0b325b272281f0462e0f7fff25a833820cac19911ff677251daf6d87bce50  glib-2.64.4.tar.xz
> +# https://urldefense.com/v3/__https://download.gnome.org/sources/glib/2.65/glib-2.65.3.sha256sum__;!!Po4YltK3bPMkYw!hzblQjKv7RMImOmwCxe7wq87L3Y21sU-E4KMU5OJhiFinOtqOuleOjgOslmygCMOnebWRZgO$
> +sha256  efd894e4693068bca945cb20d168b088510fa24d48a577f5edaf3d55912c60c2  glib-2.65.3.tar.xz
>  # License files, locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 6e9dbd7b26..d35f53abb6 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LIBGLIB2_VERSION_MAJOR = 2.64
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
> +LIBGLIB2_VERSION_MAJOR = 2.65
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = https://urldefense.com/v3/__http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)__;!!Po4YltK3bPMkYw!hzblQjKv7RMImOmwCxe7wq87L3Y21sU-E4KMU5OJhiFinOtqOuleOjgOslmygCMOnUOmyr2f$
>  LIBGLIB2_LICENSE = LGPL-2.1+
> --
> 2.29.2
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201123/5b28694c/attachment.html>
