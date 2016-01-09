From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 9 Jan 2016 01:10:51 +0100
Subject: [Buildroot] [PATCH v3] mraa: new package
In-Reply-To: <1452101054-27957-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1452024700-24200-1-git-send-email-pieterjan.camerlynck@gmail.com>
 <1452101054-27957-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <5690500B.6010302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-01-16 18:24, Pieterjan Camerlynck wrote:
> mraa provides a unified interface for IO on Galileo, Edison,
> Raspberry Pi and others
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One small additional comment below.

[snip]
> diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
> new file mode 100644
> index 0000000..9f3b953
> --- /dev/null
> +++ b/package/mraa/mraa.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# mraa
> +#
> +################################################################################
> +
> +MRAA_VERSION = v0.9.0
> +MRAA_SITE = $(call github,intel-iot-devkit,mraa,$(MRAA_VERSION))
> +MRAA_LICENSE = MIT
> +MRAA_LICENSE_FILES = COPYING
> +MRAA_INSTALL_STAGING = YES
> +

 It might be good to add:

# USBPLAT only makes sense with FTDI4222, which requires the ftd2xx library,
# which doesn't exist in buildroot


 Regards,
 Arnout

> +MRAA_CONF_OPTS += \
> +	-DBUILDSWIG=OFF \
> +	-DUSBPLAT=OFF \
> +	-DFTDI4222=OFF \
> +	-DIPK=OFF \
> +	-DRPM=OFF \
> +	-DENABLEEXAMPLES=OFF \
> +	-DTESTS=OFF
> +
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
