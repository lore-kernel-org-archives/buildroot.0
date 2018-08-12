From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:27:13 +0200
Subject: [Buildroot] [PATCH 05/18] perl-data-uuid: new package
In-Reply-To: <20180810161502.21598-6-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-6-chrismcc@gmail.com>
Message-ID: <20180812232713.74e6ba82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:14:49 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/perl-data-uuid/Config.in           | 10 ++++++++++
>  package/perl-data-uuid/perl-data-uuid.hash |  6 ++++++
>  package/perl-data-uuid/perl-data-uuid.mk   | 13 +++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/perl-data-uuid/Config.in
>  create mode 100644 package/perl-data-uuid/perl-data-uuid.hash
>  create mode 100644 package/perl-data-uuid/perl-data-uuid.mk

I've applied to next, but...


> +PERL_DATA_UUID_VERSION = 1.221
> +PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
> +PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
> +PERL_DATA_UUID_LICENSE = bsd

The license is not BSD. It's apparently some variant of the MIT license
that is documented as the "HP variant" in
https://fedoraproject.org/wiki/Licensing:MIT#HP_Variant. So I've used
the MIT-HP tag, even if it isn't documented officially by SPDX.

It seems like the license details on CPAN are sometimes wrong. Please
double check them manually whenever you submit a new Perl package in
Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
