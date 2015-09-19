From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 19 Sep 2015 22:34:45 +0300
Subject: [Buildroot] sysvinit-2.88 build is failing for ARM64
In-Reply-To: <20150918092604.6029c0a6@free-electrons.com>
References: <ec4144432f3279ce0594dd6adbd847f5e4a7fb13.1442482205.git.jpinto@synopsys.com>
 <55FA95DB.80408@synopsys.com> <20150917103540.GO11632@tarshish>
 <55FA986B.9080208@synopsys.com> <55FA9C24.2060901@synopsys.com>
 <20150917111217.GP11632@tarshish>
 <20150917230753.2ad46e4c@free-electrons.com>
 <20150917213916.GW11632@tarshish>
 <20150918092604.6029c0a6@free-electrons.com>
Message-ID: <20150919193445.GC2782@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 18, 2015 at 09:26:04AM +0200, Thomas Petazzoni wrote:
> On Fri, 18 Sep 2015 00:39:16 +0300, Baruch Siach wrote:
> > Why not use /dev/null for gcc output instead of a temporary file? 
> > Something like:
> > 
> > HAS_LIBCRYPT=$(shell echo 'int main(void) {}' | $(CC) -o /dev/null -xc - -lcrypt >/dev/null 2>&1 && echo y)
> 
> Because it is known to not work with all toolchains:
> 
>    http://git.buildroot.net/buildroot/commit/toolchain/helpers.mk?id=375bc18850f0f8fec90e1e478c0e9d2159377a64

Good to know, thanks. Maybe it's time for /dev/null.d/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
