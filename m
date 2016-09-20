From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 20 Sep 2016 09:54:25 +0200
Subject: [Buildroot] Improved patches for Arietta G25 and Aria G25 boards
In-Reply-To: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
References: <1474356875-27902-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <CA+TH9VnFhhz5mG9POQ4JdamrqEkFia1e=SU=vr1b5_QDD7r8Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Biagio,

2016-09-20 9:34 GMT+02:00 Biagio Montaruli <biagio.hkr@gmail.com>:

> Hi all,
> I have improved the previous patches that I sent to improve Buildroot
> configuration for Arietta G25 and Aria G25.
> Here you are the main changes :
>
> 1) Use the mainline linux kernel (the default version used by Buildrooot)
>
> 2) Add post-build.sh script beacause, the build of AT91bootstrap produces
>    "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin" that needs
> to be
>    renamed to "boot.bin" because the boot ROM code expects to load a file
> named
>    ar91bootstrap3 and moves the binary files in this directory.
>    Finally the script create a copy of at91sam9x5_arietta-sdcardboot-
> linux-zima$
>    with the boot.bin name that is used to build the sdcard.img with
> genimage.
>    It is necessary to move the boot.bin link in another directory since
>    we can't rename at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.6.bin
>    to boot.bin because at91sam9x5_arietta-sdcardboot-
> linux-zimage-dt-3.8.6.bin
>    and the boot.bin link are in the same directory (to avoid name
> collision).
>    Regarding the AT91bootstrap package in Buildroot,
>    I think that it should be updated to 3.8.6 version since Buildroot
>    uses the 3.8 version
>

Two things here

a) Probably you have not grasped the details of image generation, these
lines:

file boot.bin {
    image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin"
}

renames the the image file
at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.7.bin to boot.bin just at
the moment of building the sdcard image, so I can't see why we need another
script.

b) I think you have to send your patches to the Tanzilli's github with a
pull request, I really prefer to have all the Acmesystems related patches
into his repo.


>
> 3) Add genimage.cfg in order to build sdcard.img
>
> 4) Remove the local configuration of usb0
>    (which was added in the previous series of patches I sent)
>
> 5) Update documentation in readme.txt file for both Arietta and Aria
>
> Best regards,
> Biagio
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160920/cb8d3f3e/attachment.html>
