From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 31 Aug 2020 11:04:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/makedumpfile: new package
In-Reply-To: <20200830143917.16036-1-egorenar-dev@posteo.net>
References: <20200830143917.16036-1-egorenar-dev@posteo.net>
Message-ID: <CAHpTZwkpv03m49Xem7PO=HPjOt7YjjrB7hRPBCgde65HMXExow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,


+config BR2_PACKAGE_MAKEDUMPFILE
> +       bool "makedumpfile"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_STATIC_LIBS # dlopen
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
> +       select BR2_PACKAGE_ELFUTILS
> +       select BR2_PACKAGE_ZLIB
> +       select BR2_PACKAGE_BZIP2
> +       select BR2_PACKAGE_XZ
>
>
Please, select package statement  should be sorted alphabetically.


> +MAKEDUMPFILE_VERSION = 1.6.7
> +MAKEDUMPFILE_SITE =
> https://github.com/makedumpfile/makedumpfile/releases/download/Released-$(subst
> .,-,$(MAKEDUMPFILE_VERSION))
>
Use github download helper :

MAKEDUMPFILE_SITE = $(call
github,makedumpfile,makedumpfile,v$(MAKEDUMPFILE_VERSION))



> +MAKEDUMPFILE_DEPENDENCIES = zlib xz bzip2 elfutils
>

Please, dependencies should be sorted as well.


Best regards,

Jugurtha.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200831/e7466eab/attachment.html>
