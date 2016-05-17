From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 May 2016 20:50:19 +0300
Subject: [Buildroot] buildroot Kernel from local directory
In-Reply-To: <CACvocV47XHGZrtqhv=ugJi-DEA3mtkJZPYSDpsRh0XVkeTZt1g@mail.gmail.com>
References: <CACvocV47XHGZrtqhv=ugJi-DEA3mtkJZPYSDpsRh0XVkeTZt1g@mail.gmail.com>
Message-ID: <20160517175018.GC2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giovanni,

On Tue, May 17, 2016 at 03:43:17PM +0200, astrolite . wrote:
> If i have compiled my custom kernel (with relative patch and config)
> outside buildroot, and copied into boot partion, it is necessary for the
> purpose of compilation pass the path of the local kernel with relative
> config file and dts files?

You may build your kernel outside of Buildroot. You should only make sure that 
the kernel headers that are part of your toolchain are from a kernel version 
that is not newer than the kernel you run. When Buildroot builds your 
toolchain you may choose the headers version under Toolchain -> Kernel 
Headers. If you use an external toolchain it is up to you to get right.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
