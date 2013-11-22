From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 22 Nov 2013 03:33:52 -0600
Subject: [Buildroot] [PATCH v2] libcap-ng: disable on avr32 which lacks
	TLS
In-Reply-To: <1385112407-3569-1-git-send-email-s.martin49@gmail.com>
References: <1385112407-3569-1-git-send-email-s.martin49@gmail.com>
Message-ID: <OF66C8E7E4.7783087E-ON86257C2B.00344BCA-86257C2B.003487CA@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

Samuel Martin <s.martin49@gmail.com> wrote on 11/22/2013 03:26:47 AM:

[...]

> diff --git a/package/ofono/Config.in b/package/ofono/Config.in
> index c431e08..1cb41ea 100644
> --- a/package/ofono/Config.in
> +++ b/package/ofono/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_OFONO
>     depends on BR2_USE_WCHAR # gettext, libglib2
>     depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>     depends on BR2_USE_MMU # dbus
> +   depends on !BR2_avr32 # libcap-ng
>     select BR2_PACKAGE_LIBCAP_NG
>     select BR2_PACKAGE_DBUS
>     select BR2_PACKAGE_LIBGLIB2
> @@ -15,5 +16,6 @@ config BR2_PACKAGE_OFONO
>       http://ofono.org/
> 
>  comment "ofono needs a toolchain w/ wchar, threads"

Wouldn't you want comment above saying and !avr32 or something to that 
extent?

> +   depends on !BR2_avr32
>     depends on BR2_USE_MMU
>     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

Thanks,
-Ryan
