From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 17 Sep 2015 01:27:01 +0100
Subject: [Buildroot] =?utf-8?q?problem_booting_from_ext2_=C2=B5sd_card?=
In-Reply-To: <55FA01A4.5070107@proximus.be>
References: <55FA01A4.5070107@proximus.be>
Message-ID: <CA+BsyQ6yskQ6TFpZQCTMWtZka+TBNaNj2XzgWhu7RqskLN0HhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 September 2015 at 00:56, Johan Sagaert <sagaert.johan@proximus.be> wrote:
> Hi
> just extracted my rootfs to a ?sd card
> configured u-boot to boot from it
>
> Any idea ? i have a single ext2 partition on a 4GB transcend class 10 card.
> not sure where to start searching...
> Tried several cards with equal results.
> used cfdisk as tool.

It looks a bit like your ext2 partition has been set up to be much
larger than 4GB.

> mmc0: new high speed SDHC card at address 59b4
> mmcblk0: mmc0:59b4 USD   3.74 GiB
>  mmcblk0: p1

As you already highlighted - 4GB SD card.

> attempt to access beyond end of device
> mmcblk0p1: rw=0, want=11524007040, limit=7857074

So with a block size of 512 bytes, 7857074 blocks = 3.83GB (give or
take) which matches up with your SD card.

However something is trying to access block 11524007040. that ain't right.

I suspect that somehow, the ext2 filesystem on the card has been
corrupted, or has been created incorrectly, or incorrectly copied to
the card. How did you format it ?

Brendan
