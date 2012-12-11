From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 11 Dec 2012 01:13:50 +0000 (UTC)
Subject: [Buildroot] Linux build error: mixed implicit and normal rules
References: <slrnkcb9t5.17l.narkewoody@zuhnb712.local.com>
 <20121210092000.GC5482@sapphire.tkos.co.il>
Message-ID: <slrnkcd24f.28d.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-12-10, Baruch Siach
<baruch@tkos.co.il> wrote:
> Hi Woody,
>
> On Mon, Dec 10, 2012 at 09:14:12AM +0000, Woody Wu wrote:
>> I am trying to build an old Linux kernel 2.6.16. But got the error:
>> 
>> Makefile:441: mixed implicit and normal rules. stop.
>> 
>> The line 441 of Linux makefile is:
>> 
>> config %config: scripts_basic outputmakefile FORCE
>> 	$(Q)mkdir -p include/linux
>> 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
>> 	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
>> 
>> How should I fix this?  My buildroot version is 2012.08.
>
> Not related to Buildroot, but anyway...
>
> If you used GNU make version 3.82 you need something like (kernel) commit 
> 3c955b407a084810f57260d61548cc92c14bc627 (fixes for using make 3.82).
>

Sorry, what this magic number is?



-- 
woody
I can't go back to yesterday - because I was a different person then.
