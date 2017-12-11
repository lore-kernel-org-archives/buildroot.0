From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Dec 2017 07:18:26 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <1512925159-518-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1512925159-518-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20171211071826.6c12062b@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Dec 2017 17:59:19 +0100, Johannes Schmitz wrote:

> +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> +	hex "Padding byte"
> +	default 0x00
> +	help
> +	  The byte used for padding at the end of the environment image.
> +	  Needs to be correct for correct CRC checksum calculation.

I've followed somewhat remotely the discussion on IRC, and I don't
understand why changing the padding byte makes any difference for you.

Indeed, the CRC is calculated including the padding bytes. So the
padding bytes can be whatever value, as long as the CRC is matching. So
I don't understand why on your platform you are forced to use a
specific padding byte value.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
