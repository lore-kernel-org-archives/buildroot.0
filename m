From: Bradford Barr <bradford@density.io>
Date: Thu, 21 Sep 2017 10:53:48 -0400
Subject: [Buildroot] Separate board config from the rest
In-Reply-To: <HE1PR03MB3049EA7D60AC0E819A4B992FE7660@HE1PR03MB3049.eurprd03.prod.outlook.com>
References: <HE1PR03MB3049EA7D60AC0E819A4B992FE7660@HE1PR03MB3049.eurprd03.prod.outlook.com>
Message-ID: <CAPpUvYgPkYYqqJDHiC3gMihwtwj-Qy41kDPDjanBBejTV9NGFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey luke,

Page 44 of this document[1] talks about assembling different defconfig
snippets. You could divide your defconfigs into platform specific
options, and target packages and use the
./support/kconfig/merge_config.sh[2] script to combine them. I haven't
tried this myself, but I've been meaning to do something similar for
my projects. Let me know if it works out.

B

[1]: http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
[2]: https://git.busybox.net/buildroot/tree/support/kconfig/merge_config.sh

On Thu, Sep 21, 2017 at 10:46 AM, luke <skywal_l@hotmail.com> wrote:
> Hello,
>
>   My problem is I have different images which differs only by the board on which I install them (rpi0w, rpi2 or pi3) but the configuration of the toolchain, of the image, the installed packages, the overlays, etc, are the same. Each time I add a package, I need to add it to all the boards config I want to support.
>   Is there a way to separate the board specific part of a config with the configuration of the toolchain and the package selection?
>
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
