From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 20 Feb 2020 01:03:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to 1.38
In-Reply-To: <20200219231616.19489-1-petr.vorel@gmail.com>
References: <20200219231616.19489-1-petr.vorel@gmail.com>
Message-ID: <20200220000300.GA20041@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> partly tested:
> $ ./utils/test-pkg -p connman -a
>                              andes-nds32 [ 1/44]: FAILED
>                              arm-aarch64 [ 2/44]: OK
...

> NOTE: andes-nds32 it's due problems with libffi and it's not caused by this update.
> Any idea, how to disable andes-nds32?

> configure: error: "libffi has not been ported to nds32le-buildroot-linux-gnu."
> make: *** [package/pkg-generic.mk:264: /home/pvorel/br-test-pkg/andes-nds32/build/libffi-3.3/.stamp_configured] Error 1
That's Andes 32-bit, which is not supported in upstream configure.host [1].

Kind regards,
Petr

[1] https://github.com/libffi/libffi/blob/master/configure.host
