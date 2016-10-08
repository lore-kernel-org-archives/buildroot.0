From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 8 Oct 2016 13:26:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-24
In-Reply-To: <d346a372-d8a0-d669-1d97-d6309a7df651@gmail.com>
References: <20160925063044.8EA501036C4@stock.ovh.net>
 <d346a372-d8a0-d669-1d97-d6309a7df651@gmail.com>
Message-ID: <2da604e6-7c63-702b-ff1a-a7a6ea02ff2c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 25/09/2016 ? 14:23, Romain Naour a ?crit :
> Hi Thomas,
> 
> Le 25/09/2016 ? 08:30, Thomas Petazzoni a ?crit :
>> Hello,
>>
>> Build statistics for 2016-09-24
>> ================================
>>
>>       successes : 218
>>        failures : 124
>>        timeouts : 5  
>>           TOTAL : 347
>>
>> Classification of failures by reason
>> ====================================
>>
>>                 alsa-lib-1.1.2 | 5 
>>
>> Detail of failures
>> ===================
>>
>>        nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/1fc9806a62b813b085c39d36000f4d9d18f779df
>>        nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/03eb11b6a783da1985c19858f6c5f69027e0ed9c
>>        nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/d620812ae79c4e8252d2b0c410f94e9cdcbcfbc3
>>        nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/04b7609f5decc71bf25e981f14756029715fc621
>>        nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e85be7ffd62e7ab95c4dd0049b0c67ae98f75543
> 
> As Gustavo said yesterday on IRC about Qemu-kernel-target version matching
> "sometimes there's a star alignment where everything works, but that's not
> always the case", here is the same about binutils-gcc-target.
> 
> The new nios2 toolchain doesn't work here due to binutils-gcc version mismatch
> (binutils 2.26.1 and gcc 5.4). I also tried with several build options (O1 and
> 02) but it still fail with the same error.
> 
> I've build some nios2 toolchains and it appear that gcc5 require binutils <=
> 2.25 on this platform.
> If gcc6 is used with binutils 2.26.1, alsa-lib build fine.
> 
> For now, I haven't investigated on the gcc history to find an upstream patch to
> backport but it can be time consuming...
> 
> So, ether we rebuild the nios2 toolchain with binutils 2.25.1 or we bump the gcc
> version. But we have to rebuild this toolchain anyway.
> 
> I would suggest to fallback to binutils 2.25.1 in order to avoid gcc6 issue (we
> already have our bleeding edge toolchain for that ;-) ).

I reported the bug to Binutils:
https://sourceware.org/bugzilla/show_bug.cgi?id=20674

In the same time, I'll summit a patch to avoid such binutils-gcc association on
Nios2.

Best regards,
Romain

> 
>>        nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0c6b321e490f7da90cc727734baa0440321d16ba
> 
> Code Sourcery Binutils issue (fixed in our internal toolchain):
> BFD (Sourcery CodeBench Lite 2016.05-10) 2.25.51 assertion fail
> /scratch/sandra/nios2-linux-spring-release/obj/binutils-src-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu/bfd/elf32-nios2.c:1908
> 
> Add an autobuilder exception for this toolchain ?
> 
>>        nios2 |              freeswitch-1.6.10 | NOK | http://autobuild.buildroot.net/results/96f69b7be1978f85271e2827c2e18d4ed8de8dfc
> 
> /tmp/ccKF8wFF.s: Assembler messages:
> /tmp/ccKF8wFF.s:5644: Error: r31 cannot be used with jmp; use ret instead
> 
> Same toolchain issue than for alsa-lib.
> 
>>        nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a5ef0a9d8fec3c75cef55dd8f3c14ead353c92db
>>        nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/21be31a3163dbdef58f4d9361619710c05a1fd86
> 
> Not related to nios2.
> 
> Best regards,
> Romain
> 
