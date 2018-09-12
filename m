From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:26:25 +0200
Subject: [Buildroot] [PATCH 04/18] perl-time-parsedate: new package
In-Reply-To: <20180820115519.24046-5-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-5-chrismcc@gmail.com>
Message-ID: <20180912222625.01e793d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:05 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                                           |  1 +
>  package/Config.in                                    |  1 +
>  package/perl-time-parsedate/Config.in                |  6 ++++++
>  package/perl-time-parsedate/perl-time-parsedate.hash |  6 ++++++
>  package/perl-time-parsedate/perl-time-parsedate.mk   | 13 +++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/perl-time-parsedate/Config.in
>  create mode 100644 package/perl-time-parsedate/perl-time-parsedate.hash
>  create mode 100644 package/perl-time-parsedate/perl-time-parsedate.mk

I have applied this patch, after fixing the license details, see below.


> +# computed by scancpan
> +sha256 a8f6d313ecc680934da33872f69e6f4fa64ad9840b016d4d4822e952e518a964 README

This README file contained nothing that is useful from a license point
of view.

> +PERL_TIME_PARSEDATE_LICENSE_FILES = README
> +PERL_TIME_PARSEDATE_LICENSE = unknown

I have changed this to:

+PERL_TIME_PARSEDATE_LICENSE = Time Parse Date License, Public Domain
+PERL_TIME_PARSEDATE_LICENSE_FILES = lib/Time/JulianDay.pm lib/Time/Timezone.pm

Indeed, most files are under the special "Time Parse Date License",
except Timezone.pm, which is in the public domain. I've updated
the .hash file to include the hashes of JulianDay.pm and Timezone.pm.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
