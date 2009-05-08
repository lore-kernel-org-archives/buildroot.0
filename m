From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 8 May 2009 13:59:36 -0300
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
Message-ID: <d6cda7730905080959j711986b7t181ac09c81d2475c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2009/5/8 Thiago A. Corr?a <thiago.correa@gmail.com>:
>> ?Thiago> Unfortunally, it doesn't look like it. Even if I select
>> ?Thiago> 2.6.29 for the linux headers (toolchain), the build
>> ?Thiago> fails. Unless I actually update the kernel on the target, it
>> ?Thiago> fails to build for avr32. According to the avr32-linux
>> ?Thiago> mailling list, there was a byteorder.h restructuring a while
>> ?Thiago> back, so I guess some versions of the headers are not what
>> ?Thiago> iptables expects.
>>
>> I still don't get it - I've never used the Linux.advanced stuff, but
>> it's just used to build a kernel for the target and doesn't have
>> anything to do with the rootfs, right? How can it then influence the
>> iptables build?
>
> Perhaps it's how it touches all the LINUX26* variables. I have no idea
> either. I just tried to update and it worked. I might just be loosing
> my mind and tested it wrong, could have forgot to run a toolchain with
> 2.6.29 and kernel 2.6.28 test and thought that I had. I've been awake
> for 36 hours already and still have to study for German test tomorrow
> (as second foreign language).
>
> I will leave this building with toolchain kernel headers 2.26.9 and
> advanced linux 2.26.7 and see if iptables fails to compile again.
>

It turns out I was a bit too tired and thought I tested it with 2.6.29
kernel headers and < 2.6.29 kernel.

iptables can't build with toolchain kernel headers earlier than 2.6.29
under avr32, what actually fixed the build was the atngw100_defconfig
update. Good thing I removed that "fix iptables" bit from the logs :D

Cheers,
   Thiago A. Correa
