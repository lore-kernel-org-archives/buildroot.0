From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2014 12:31:50 +0100
Subject: [Buildroot] [pkg-perl infra V3 11/12] libnet-ssleay-perl: new
 package
In-Reply-To: <1385198749-6249-12-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <1385198749-6249-12-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140204113150.GH3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2013-11-23 10:25 +0100, Francois Perrad spake thusly:
> (depends on openssl)

Not needed in the commit log.

> diff --git a/package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk b/package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk
> new file mode 100644
> index 0000000..e067511
> --- /dev/null
> +++ b/package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libnet-ssleay-perl
> +#
> +################################################################################
> +
> +LIBNET_SSLEAY_PERL_VERSION = 1.53
> +LIBNET_SSLEAY_PERL_AUTHOR = MIKEM
> +LIBNET_SSLEAY_PERL_SOURCE = Net-SSLeay-$(LIBNET_SSLEAY_PERL_VERSION).tar.gz
> +LIBNET_SSLEAY_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM/
> +LIBNET_SSLEAY_PERL_DEPENDENCIES = perl openssl
> +HOST_LIBNET_SSLEAY_PERL_DEPENDENCIES = host-openssl
> +LIBNET_SSLEAY_PERL_LICENSE = ssleay

Missing _LICENSE_FILES.

> +$(eval $(perl-package))
> +$(eval $(host-perl-package))

Do we need the host variant?

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
