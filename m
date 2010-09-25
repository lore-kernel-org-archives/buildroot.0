From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 25 Sep 2010 17:31:10 +0200
Subject: [Buildroot] "make menuconfig" possibly broken in git master
In-Reply-To: <87iq1t7tta.fsf@macbook.be.48ers.dk>
References: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
	<87mxr66mv9.fsf@macbook.be.48ers.dk>
	<AANLkTi=OWG3Q2z2_G4QNU45fFf78391GB2kx5SjUkBLv@mail.gmail.com>
	<87iq1t7tta.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=aSSpv06gYd8_eaHdMxDBuPJrd5+AZJo1kgns7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/9/25 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> ?Bj?rn> 2010/9/25 Peter Korsgaard <jacmet@uclibc.org>:
> ?>>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
> ?>>
> ?>> ?Bj?rn> Hi all,
> ?>> ?Bj?rn> My buildroot git master tree fails to "make menuconfig" because of
> ?>> ?Bj?rn> "zconf.tab.c:181: error: conflicting types for ?symbol_hash?":
> ?>>
> ?>> Strange - Could you try the the same with a recent linux kernel
> ?>> (E.G. 2.6.36-rc5)?
>
> ?Bj?rn> As the commands "make distclean && make defconfig/menuconfig" fail
> ?Bj?rn> I don't know how to specify another kernel version. So I assume you mean
> ?Bj?rn> the kernel on build host. I'm on Ubuntu 10.04 and the last time I tried my
> ?Bj?rn> own kernel on a Ubuntu system it barely booted. So no, I dare not try a
> ?Bj?rn> recent kernel just yet :-)
>
> No, I actually meant go and download a Linux kernel tarball (E.G. from
> kernel.org), extract it and run make menuconfig. The menuconfig stuff in
> buildroot comes from the Linux kernel.

Oh, I see :-)

> But looking at Lionel's mail it seems to be an issue about certain files
> not getting rebuilt. Could you do a fresh git clone and try in that dir
> or alternatively run make O=output2 menuconfig?

I tried a fresh git clone and it worked fine.

I think I've found the exact issue: package/config/zconf.tab.c wasn't
being rebuilt.
I removed that file, it got rebuilt and the issue was gone.
I think 'make distclean' should clean package/config/zconf.tab.c (and
all *.o files in
package/config/) or this issue may appear next time package/config/ is
synced with upstream.

Best regards,
Bj?rn Forsman
