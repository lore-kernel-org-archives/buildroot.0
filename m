From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 12 Aug 2018 11:21:07 +0200
Subject: [Buildroot] [PATCH 06/17] perl-module-runtime: add host
In-Reply-To: <20180811182749.20924-7-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-7-chrismcc@gmail.com>
Message-ID: <CAB0FRssyWKMjxCeX9WHg7K-P5A97W32X4Qr=S8EvMOTBovn5LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most of the time, host-perl-* packages are useless on BuildRoot,
please, double check the package which introduces this dependency.

Note: host-perl-module-build & host-perl-module-build-tiny are obviously
useful.

Fran?ois


2018-08-11 20:27 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/perl-module-runtime/perl-module-runtime.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/perl-module-runtime/perl-module-runtime.mk
> b/package/perl-module-runtime/perl-module-runtime.mk
> index 5ba95f7056..44981dc546 100644
> --- a/package/perl-module-runtime/perl-module-runtime.mk
> +++ b/package/perl-module-runtime/perl-module-runtime.mk
> @@ -8,7 +8,9 @@ PERL_MODULE_RUNTIME_VERSION = 0.016
>  PERL_MODULE_RUNTIME_SOURCE = Module-Runtime-$(PERL_MODULE_
> RUNTIME_VERSION).tar.gz
>  PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
>  PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
> +HOST_PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
>  PERL_MODULE_RUNTIME_LICENSE = Artistic or GPL-1.0+
>  PERL_MODULE_RUNTIME_LICENSE_FILES = README
>
>  $(eval $(perl-package))
> +$(eval $(host-perl-package))
> --
> 2.14.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180812/a3ed7d20/attachment.html>
