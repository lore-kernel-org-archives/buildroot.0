From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Sep 2017 13:32:13 +0200
Subject: [Buildroot] [PATCH v2] package/dfu-util: allow to build it for
 the target as well
In-Reply-To: <339edb91-644e-2456-b627-262d81c1afaa@grandegger.com>
References: <339edb91-644e-2456-b627-262d81c1afaa@grandegger.com>
Message-ID: <b70e4712-d1c5-08b1-415a-00b9d86f1061@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-09-17 09:11, Wolfgang Grandegger wrote:
> +config BR2_PACKAGE_DFU_UTIL
> +	bool "dfu-util"
> +	select BR2_PACKAGE_LIBUSB

 As I mentioned in my first reply, you also need to propagate libusb's
dependency on threads and the corresponding comment.

 Regards,
 Arnout

> +	help
> +	  Dfu-util is the host side implementation of the DFU 1.0
> +	  specification of the USB forum. DFU is intended to download
> +	  and upload firmware to devices connected over USB.
> +
> +	  http://dfu-util.sourceforge.net/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
