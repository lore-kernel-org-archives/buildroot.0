From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Tue, 12 Dec 2017 10:04:38 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
Message-ID: <CAMbDF3+bn0hyNGLz42r-kXXS+6BL2Wig-ZHxhG7fOFyEhTQS7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> +     hex "Padding byte"
> +     default 0x00
> +     help
> +       The byte used for padding at the end of the environment image.

I'm still not sure what is the point of customizing the padding byte.
Does someone has a use-case for that ? If not, I'm not sure it makes
sense to add a Buildroot option for it.


I find it definitely useful for debugging. I wouldn't have been able to
isolate the issue with the size and CRC without this option because if you
want to compare with hexdump you want everything to exactly match to see
what's wrong. Without this, the next person might go down the same way like
myself. The default of uboot when saving the environment is 0x00 and the
default of mkenvimage is 0xFF. My idea is to make it the same to (0x00) to
make the developers life easier. My experience is that any of these details
takes some amount of your time to sort out so a less confusing default can
safe time for everyone. On the other hand people might want to deliberately
set it to 0xFF to exactly check the boarders of the env partition on the SD
card, especially during development of genimage.cfg. Furthermore it makes
you understand quicker what happens during env image generation. If you
hide the option from the user/platform developer again makes life harder. I
am speaking from the point of view of a buildroot newcomer. Now of course I
now what's going on but would that option have been there it would have
saved me one afternoon.

Regards
Johannes
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171212/22cc0c96/attachment.html>
