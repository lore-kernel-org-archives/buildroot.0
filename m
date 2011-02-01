From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 1 Feb 2011 02:50:46 -0500
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
 Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <DB904C5425BA6F4E8424B3B51A1414D165B430B838@NWD2CMBX1.ad.analog.com>
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
	<AANLkTi=F8BRtskBBKE_Wno=Vy=EHvLjE3bkYagiAuegH@mail.gmail.com>
	<AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
	<AANLkTik6Pq6j33vqKyZ-fkuGat8KwwEDAxuW08y0cDit@mail.gmail.com>
	<DB904C5425BA6F4E8424B3B51A1414D165B430B838@NWD2CMBX1.ad.analog.com>
Message-ID: <AANLkTi=5O7TL7KrCD8Ja1XKvYBWUboxjU6biOw=-MXwd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 1, 2011 at 02:48, Zhang, Sonic wrote:
>Mike Frysinger:
>>On Mon, Jan 31, 2011 at 23:43, Sonic Zhang wrote:
>>> Some autotools based software packages generate prefix name to the
>>> binary after running install if you set --target parameter.
>>>
>>> For example:
>>> --target=arm
>>> rcp is rename to "linux-arm-rcp" after running install
>>
>>this is due to program_transform_name which is easily disabled:
>> ? ?program_transform_name=
>
> Not only inetutils, but many other packages need "program_transform_name=" in this case. Because rare packages require --target to be set, why not do something to ease many?

personally, i prefer the route of fixing the underlying problem --
these packages should not have a --target unless they actually need
it.
-mike
