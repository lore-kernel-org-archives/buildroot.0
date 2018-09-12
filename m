From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:35:21 +0200
Subject: [Buildroot] [PATCH 12/18] perl-soap-wsdl: new package
In-Reply-To: <20180820115519.24046-13-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-13-chrismcc@gmail.com>
Message-ID: <20180912233521.48674110@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:13 -0700, Christopher McCrory wrote:

> +PERL_SOAP_WSDL_VERSION = 3.003
> +PERL_SOAP_WSDL_SOURCE = SOAP-WSDL-$(PERL_SOAP_WSDL_VERSION).tar.gz
> +PERL_SOAP_WSDL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
> +PERL_SOAP_WSDL_DEPENDENCIES = perl-class-load perl-class-std-fast perl-template-toolkit perl-timedate perl-uri perl-xml-parser perl-libwww-perl
> +# perl-termreadkey needs license clarifications before adding to buildroot
> +# PERL_SOAP_WSDL_DEPENDENCIES += perl-termreadkey

I don't understand, is perl-termreadkey a mandatory dependency, or an
optional dependency ?

If it's a mandatory dependency, then this PATCH 12/18 doesn't work,
because it is absolutely needed for perl-soap-wsdl to build/work.

If it's an optional dependency, then PATCH 18/18 is wrong because it
adds it as a mandatory dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
