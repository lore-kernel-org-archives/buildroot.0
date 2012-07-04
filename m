From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Wed, 4 Jul 2012 11:53:30 +0100
Subject: [Buildroot] syslinux fails to build
Message-ID: <CAJkQPOmE5CcY=sAp-+TmuYEov_QTSe1-qsqj8fRjtOQNvDoWnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My git HEAD is a1b7bec1760692e7db19062c76dc905e77054479

Building the syslinux 4.04 bootloader fails with:

make[3]: Entering directory
`/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag/geodsp'
./mk-lba-img lba.img
./mk-lba-img: 1: ./mk-lba-img: Syntax error: "(" unexpected
make[3]: *** [lba.img] Error 2
make[3]: Leaving directory
`/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag/geodsp'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/aras/buildroot/buildroot/output/build/syslinux-4.04'
make: *** [/home/aras/buildroot/buildroot/output/build/syslinux-4.04/.stamp_built]
Error 2

Is this a known problem?


I bumped the version to 4.05 but compilation fails. I researched the
problem and found a patch that makes the build work:

http://web.archiveorange.com/archive/v/mwjwm6LzqZy83B2DDQIJ

Shall I submit a patch for:

* the bump to 4.05,
* the patch to make 4.05 compile (which would be a copy of the patch
from Geert Stappers) ?

regards,

Aras Vaichas
