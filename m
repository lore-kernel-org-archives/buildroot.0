From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 3 Sep 2016 15:10:20 -0300 (BRT)
Subject: [Buildroot] [autobuild.buildroot.net] Build results
	for	2016-09-02
In-Reply-To: <2181287.8UlWShMbI3@sagittea>
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
Message-ID: <760420464.3255032.1472926220380.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "J?r?me Pouiller" <jezz@sysmic.org>
> To: buildroot at busybox.net
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Alexey Brodkin" <Alexey.Brodkin@synopsys.com>
> Sent: Saturday, September 3, 2016 1:03:13 PM
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Build results for	2016-09-02

> On Saturday 03 September 2016 08:30:33 Thomas Petazzoni wrote:
> [...]
>> mips64el |              util-linux-2.28.1 | NOK |
>> http://autobuild.buildroot.net/results/e45931629ee3f5dc45de6940a2c0983435f77e00
>>      sh4 |              util-linux-2.28.1 | NOK |
>> http://autobuild.buildroot.net/results/b3649dedd048515844675cd48b84bab74eb897f8
>>   x86_64 |              util-linux-2.28.1 | NOK |
>> http://autobuild.buildroot.net/results/26b3a4de1fb8b366727299ff5de7d59b3e521c23
> 
> wget do not accept certificate from cdn.kernel.org. It seems to be
> related to :
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=409938
> 
> wget >= 1.13-1 is necessary to fix problem. I see three solutions:
>  1. Revert de76cb7da734dde2204a7ea9ff60e24cbe857ddb ("Use CDN
>     kernel.org mirror")

This can slow down the downloading of many source files.

>  2. Use http instead if https

I suspect that this would require passing "--no-hsts" to wget (did not test with an old version to confirm).

>  3. Check wget version in dependencies.sh

What would be the approach, in thes case, compiling wget as a host tool?

> Any opinion?

I'd vote for option 3, since wget 1.13.1 is already five years old. I'd ask the developer to migrate to a more up-to-date OS installation rather than spending a lot of effort to circumvent the problem in Buildroot.

Carlos Santos (Casantos)
DATACOM, P&D
