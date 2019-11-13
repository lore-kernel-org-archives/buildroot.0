From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 13 Nov 2019 22:13:43 +0100
Subject: [Buildroot] Linaro Toolchain for RPI and OABI Issues
In-Reply-To: <1573650440531-0.post@n4.nabble.com>
References: <1573542699220-0.post@n4.nabble.com>
 <20191112201551.1f1f6190@gmx.net>
 <1573650440531-0.post@n4.nabble.com>
Message-ID: <20191113221343.2eb4fad3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello rscr,

On Wed, 13 Nov 2019 07:07:20 -0600 (CST), rscr <rafacrespiramon@gmail.com> wrote:

> Hi Peter,
>
> Keeps not working.
>
> I have changed to new recommended cross-compiler for x64
> (arm-rpi-4.9.3-linux-gnueabihf) and I get the same error too.

Are your sure buildroot uses your configured compiler?

Take a look at toolchain/helpers.mk and the check for OABI,
the check is (simpliefied):

	$ <yout_path_to_toolchain>/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi-gcc -v 2>&1 | grep ^Target | cut -f2 -d ' '
	arm-bcm2708-linux-gnueabi

	$ echo arm-bcm2708-linux-gnueabi | grep -E 'eabi(hf)?$$'
	arm-bcm2708-linux-gnueabi

Regards,
Peter

>
> Thanks
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
