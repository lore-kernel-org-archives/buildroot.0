From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 May 2015 09:46:43 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
Message-ID: <20150527094643.0dcb2107@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent Joli,

On Tue, 26 May 2015 18:34:43 +0200, Laurent Joli wrote:

> When I ticked for Marvell driver : SKY2 and  SKY2_DEBUG
> 
> At the end of the build, I have not sky2.ko in my rootfs.
> 
> What can I do for obtain sky2 drivers ?

Depends on how you enabled these drivers: as a module, or statically
linked into the kernel?

Also, what was your exact flow of work?

Basically, you need to do:

	make qmx6_defconfig
	make linux-menuconfig
	... select the sky2 driver ...
	make

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
