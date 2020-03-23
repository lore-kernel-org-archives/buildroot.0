From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 23 Mar 2020 19:24:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/libtirpc: fix build when
 missing <bits/endian.h>
In-Reply-To: <20200305043947.GA2842054@x230>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
 <20200228173052.5128-2-petr.vorel@gmail.com>
 <20200305043947.GA2842054@x230>
Message-ID: <20200323182443.GA3832536@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > This issue seems to be happening only on the next branch. Why? Anything
> > special in next compared to master?
Now, the error got propagated to the master, it'll fix failures on riscv64 and
arm:

http://autobuild.buildroot.net/results/4f423c95e290ec99fec263a839e3336362e7003c
http://autobuild.buildroot.net/results/04fdf097b9aeda2e831c9138110b527e1e6ee5ea
http://autobuild.buildroot.net/results/531156fd470eeb287e1761c5f0c17c68fe1e7888
http://autobuild.buildroot.net/results/678cd9b11160e3995e61afc8579b579702429ef5
http://autobuild.buildroot.net/results/940e4212a7d029e6495af3d5cacc8e3bbc9e78ff

You can merge it with previous one (gcc-10 fix [1]), or I can sent v2 with just
this patch (then I'd rename patch number from 6 to 5).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1246746/
