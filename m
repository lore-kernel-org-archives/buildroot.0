From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 16 Oct 2011 10:47:34 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 4.44
In-Reply-To: <20111015213701.E38898E24C@busybox.osuosl.org>
References: <20111015213701.E38898E24C@busybox.osuosl.org>
Message-ID: <4E9A9A26.2050409@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 15/10/2011 23:23, Peter Korsgaard a ?crit :
> commit: http://git.buildroot.net/buildroot/commit/?id=5222067783a0b4f20f5a68e6aa57817cca5c35a3
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
> ---
>   package/stunnel/stunnel.mk |    5 ++---
>   1 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index 1f40397..6088e58 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -4,10 +4,9 @@
>   #
>   #############################################################
>
> -STUNNEL_VERSION = 4.36
> -STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x/
> +STUNNEL_VERSION = 4.44
> +STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
>   STUNNEL_DEPENDENCIES = openssl
> -

There's a problem with that. They have a kind of silly policy to store 
the archives. In the "main" folder, there is only the latest version, 
while every other version are in obsolete/4.x/. So this will break as 
soon as a new version will be released, and that was why I put obsolete 
in the first place.

Maxime
