From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 10 Dec 2012 11:20:00 +0200
Subject: [Buildroot] Linux build error: mixed implicit and normal rules
In-Reply-To: <slrnkcb9t5.17l.narkewoody@zuhnb712.local.com>
References: <slrnkcb9t5.17l.narkewoody@zuhnb712.local.com>
Message-ID: <20121210092000.GC5482@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Woody,

On Mon, Dec 10, 2012 at 09:14:12AM +0000, Woody Wu wrote:
> I am trying to build an old Linux kernel 2.6.16. But got the error:
> 
> Makefile:441: mixed implicit and normal rules. stop.
> 
> The line 441 of Linux makefile is:
> 
> config %config: scripts_basic outputmakefile FORCE
> 	$(Q)mkdir -p include/linux
> 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
> 	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
> 
> How should I fix this?  My buildroot version is 2012.08.

Not related to Buildroot, but anyway...

If you used GNU make version 3.82 you need something like (kernel) commit 
3c955b407a084810f57260d61548cc92c14bc627 (fixes for using make 3.82).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
