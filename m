From: Souf Oued <souf_oued@yahoo.fr>
Date: Sun, 18 Apr 2010 23:19:47 +0200
Subject: [Buildroot] There are not device files in dev/ when I extract
 tarball image as root. bug?
In-Reply-To: <87ljckcxcx.fsf@macbook.be.48ers.dk>
References: <o2p2134af141004161820q79e42c27s847369b14bfa8c13@mail.gmail.com>	<20100417053913.528536ef@surf>
	<87ljckcxcx.fsf@macbook.be.48ers.dk>
Message-ID: <4BCB7773.9010003@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 18/04/2010 22:35, Peter Korsgaard a ?crit :
>>>>>> "Thomas" == Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  writes:
>
>   >>  Does it must mknod manually?
>
>   Thomas>  No, it's a regression that I caused by the recent filesystem code
>   Thomas>  cleanup. I'm working on the fix. As an ugly workaround you can add:
>
>   Thomas>  TARGET_DEVICE_TABLE=target/device/generic/device_table.txt
>
>   Thomas>  at the beginning of fs/common.mk.
>
> And with the new BR2_ROOTFS_DEVICE_TABLE kconfig setting Thomas added.
>
Simply put :
include fs/common.mk (line 321)
after
include target/Makefile.in  (line 324)

in buildroot/Makefile

Thanks.
