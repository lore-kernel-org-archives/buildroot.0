From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 27 Sep 2010 09:12:26 +0200
Subject: [Buildroot] "make menuconfig" possibly broken in git master
In-Reply-To: <8762xt7da8.fsf@macbook.be.48ers.dk>
References: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
	<87mxr66mv9.fsf@macbook.be.48ers.dk>
	<AANLkTi=OWG3Q2z2_G4QNU45fFf78391GB2kx5SjUkBLv@mail.gmail.com>
	<87iq1t7tta.fsf@macbook.be.48ers.dk>
	<AANLkTi=aSSpv06gYd8_eaHdMxDBuPJrd5+AZJo1kgns7@mail.gmail.com>
	<8762xt7da8.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikdUOgsTeywSyYdXidXZpPuY_E6YzoRsDWjNCbZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/9/25 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> Hi,
>
> ?Bj?rn> I think I've found the exact issue: package/config/zconf.tab.c wasn't
> ?Bj?rn> being rebuilt.
> ?Bj?rn> I removed that file, it got rebuilt and the issue was gone.
> ?Bj?rn> I think 'make distclean' should clean package/config/zconf.tab.c (and
> ?Bj?rn> all *.o files in
> ?Bj?rn> package/config/) or this issue may appear next time package/config/ is
> ?Bj?rn> synced with upstream.
>
> The distclean does clean everything currently used, but the problem is
> that these files used to exist in package/config, but are now in
> output/build/buildroot-config, and the original makefile gets a bit
> confused when there's old files in package/config.

Ok, so it's already fixed. Good :-)

Best regards,
Bj?rn Forsman
