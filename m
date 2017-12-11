From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Mon, 11 Dec 2017 07:48:06 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <20171211071826.6c12062b@windsurf.png.is.keysight.com>
References: <1512925159-518-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171211071826.6c12062b@windsurf.png.is.keysight.com>
Message-ID: <CAMbDF3KT17vM0c4s_bAh2i=+5trPtgkdMbjgA6K8-w1o1-CbXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
this is a good question. So far I just know that reading the environment
only worked for me with a 0x00 padding. Just to be sure it was not a
combined problem of size and padding I can try again with the mkenvimage
default of 0xFF and the correct size.
In any case the padding option should be added to expose the full
mkenvimage capabilities, however if you're right I might have to edit the
help text again and remove the statement about the CRC calculation.

Regards
Johannes

Am 11.12.2017 7:18 vorm. schrieb "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com>:

Hello,

On Sun, 10 Dec 2017 17:59:19 +0100, Johannes Schmitz wrote:

> +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> +     hex "Padding byte"
> +     default 0x00
> +     help
> +       The byte used for padding at the end of the environment image.
> +       Needs to be correct for correct CRC checksum calculation.

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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171211/527a4e9b/attachment.html>
