From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 02 Jun 2014 22:29:59 +0200
Subject: [Buildroot] [PATCHv2 1/6] minidlna: do not select
	BR2_PACKAGE_GETTEXT_TOOLS
References: <1401654214-19384-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401654214-19384-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <7f3v5bx3rr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in
news:1401654214-19384-2-git-send-email-thomas.petazzoni at free-electrons.com:

> diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
> index 4a46b0c..5c5306d 100644
> --- a/package/minidlna/Config.in
> +++ b/package/minidlna/Config.in
> @@ -14,7 +14,6 @@ config BR2_PACKAGE_MINIDLNA
>       select BR2_PACKAGE_LIBJPEG
>       select BR2_PACKAGE_SQLITE
>       select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> -     select BR2_PACKAGE_GETTEXT_TOOLS if BR2_NEEDS_GETTEXT_IF_LOCALE
>       help
>         MiniDLNA (aka ReadyDLNA) is server software with the aim of
>         being fully compliant with DLNA/UPnP-AV clients.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

using this minimal defconfig:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PACKAGE_MINIDLNA=y
