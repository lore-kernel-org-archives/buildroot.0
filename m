From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Apr 2015 21:52:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-libwww: Fix legal-info
In-Reply-To: <1429551651-21509-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429551651-21509-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <553558F7.7000205@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 20/04/2015 19:40, Bernd Kuhls a ?crit :
> Fixes
> http://autobuild.buildroot.net/results/6c6/6c6fb6001101ff528176b887ed8c95ef49313afb/
> http://autobuild.buildroot.net/results/56d/56d42e7691d4eb1a682c49c0fa6c951d0e3069ec/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

The git hash is also wrong.

First I get an error wile testing the hash series:
ERROR: No hash found for perl-libwww-6.13.tar.gz

Then, by renaming libwww-perl-6.13.tar.gz to perl-libwww-6.13.tar.gz
ERROR: perl-libwww-6.13.tar.gz has wrong md5 hash:
ERROR: expected: 85b36bcd2fd2450718ee14f894f0d3d1
ERROR: got     : eadcb8e0d6657817290328cc8976764e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

I get:
md5    eadcb8e0d6657817290328cc8976764e perl-libwww-6.13.tar.gz
sha256 ee80e56e2866fdd91f8dc25b91cfdb1f3582ea9cc1ab53a0c420fef07bb3f04d perl-libwww-6.13.tar.gz

instead of:

md5    85b36bcd2fd2450718ee14f894f0d3d1 libwww-perl-6.13.tar.gz
sha256 5fbd13eebd1933e5a203fceb2c1629efbccff3efc8fab6ec0285c79d0a95f8b2 libwww-perl-6.13.tar.gz

The archive has been generated automatically by github, not by the maintainer.
it's probably not the very same archive.

Best regards,
Romain

>  package/perl-libwww/perl-libwww.mk |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/perl-libwww/perl-libwww.mk b/package/perl-libwww/perl-libwww.mk
> index 0ee1e04..00b59c4 100644
> --- a/package/perl-libwww/perl-libwww.mk
> +++ b/package/perl-libwww/perl-libwww.mk
> @@ -7,7 +7,6 @@
>  PERL_LIBWWW_VERSION = 6.13
>  PERL_LIBWWW_SITE = $(call github,libwww-perl,libwww-perl,$(PERL_LIBWWW_VERSION))
>  PERL_LIBWWW_LICENSE = Artistic or GPLv1+
> -PERL_LIBWWW_LICENSE_FILES = LICENSE
>  PERL_LIBWWW_DEPENDENCIES = \
>  	perl-encode-locale \
>  	perl-file-listing \
> 
