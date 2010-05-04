From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 05 May 2010 00:15:09 +0200
Subject: [Buildroot] [PATCH 33/41] libsoup: bump to 2.28.2
In-Reply-To: <87r5mih3dm.fsf@macbook.be.48ers.dk>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-34-git-send-email-llandwerlin@gmail.com>
	<87r5mih3dm.fsf@macbook.be.48ers.dk>
Message-ID: <1273011309.27748.3.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2010-04-14 at 09:58 +0200, Peter Korsgaard wrote:
> >>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:
> 
>  llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
>  llandwerlin> Also, remove --disable-gtk-doc (it's already in package/Makefile.in)
>  llandwerlin> and fix libsoup dependencies. When compiled with ssl support it
>  llandwerlin> requires libgnutls and libgcrypt.
> 
>  llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
>  llandwerlin> ---
>  llandwerlin>  package/libsoup/Config.in  |    1 +
>  llandwerlin>  package/libsoup/libsoup.mk |   13 ++++++-------
>  llandwerlin>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
>  llandwerlin> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
>  llandwerlin> index 6bccd11..596a638 100644
>  llandwerlin> --- a/package/libsoup/Config.in
>  llandwerlin> +++ b/package/libsoup/Config.in
>  llandwerlin> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSOUP
>  llandwerlin>  	bool "libsoup"
>  llandwerlin>  	select BR2_PACKAGE_LIBXML2
>  llandwerlin>  	select BR2_PACKAGE_LIBGLIB2
>  llandwerlin> +        select BR2_PACKAGE_LIBGNUTLS
> 
> <tab> please.
>  
>  llandwerlin> -LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2
>  llandwerlin> +LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2 libgnutls libgcrypt
>  
> 
> So how do you compile it WITHOUT ssl support?

I have a patch sitting in our repository that adds
BR2_PACKAGE_LIBSOUP_SSL to make SSL support optional. Would you be
interested in that patch?

I very much hope that we will get the time next week to update our
buildroot tree to the latest version. That would finally allow me to
submit patches again...


Sven
