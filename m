From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:38:40 +0200
Subject: [Buildroot] [PATCH 08/18] perl-device-serialport: new package
In-Reply-To: <20180810161502.21598-9-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-9-chrismcc@gmail.com>
Message-ID: <20180812233840.2770c098@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:14:52 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                                          |  1 +
>  package/perl-device-serialport/Config.in                   | 10 ++++++++++
>  package/perl-device-serialport/perl-device-serialport.hash |  6 ++++++
>  package/perl-device-serialport/perl-device-serialport.mk   | 12 ++++++++++++
>  4 files changed, 29 insertions(+)

I've applied to next, but ...

> +PERL_DEVICE_SERIALPORT_VERSION = 1.04
> +PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSION).tar.gz
> +PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
> +PERL_DEVICE_SERIALPORT_LICENSE_FILES = README

The _LICENSE variable was missing, even though the licensing terms were
clearly specified in the README file. Once again, please double check
the output of scancpan, which may not be complete.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
