From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 4 Apr 2019 18:10:37 +0300
Subject: [Buildroot] [Q] Make kconfig more flexible with selecting options
Message-ID: <CAMw6YJJjLr3GwmZzBMymTGnirpW8BoVD9o4B-Hye69=QRLA83g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All!

I am almost sure that the idea will be rejected but I will try)

I am trying to make external buildroot trees ability to select any
config option,
even if it is not boolean or tristate.

For example, I have external rpi br2 tree which in case of u-boot would
select default uboot board name as "rpi_3_32b" (BR2_TARGET_UBOOT_BOARD_DEFCONFIG
if it not set already), something like this:

----------------
config XXX
    default BR2_TARGET_UBOOT_BOARD_DEFCONFIG "rpi_3_32b"
-----------------

of course to make it possible it needs to extend the kconfig parser,
there is one
RFC which I think allows to select config option with value other than
tristate or boolean:

    https://marc.info/?l=linux-kbuild&m=127956469118089&w=2

and the linux kernel community rejected this approach ( I did not dig
into the implementation in details).

Regards,
Vadim Kochan
