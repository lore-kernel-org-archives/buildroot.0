From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 May 2014 07:06:30 +0300
Subject: [Buildroot] Why must I specify toolchain kernel headers?
In-Reply-To: <CAE21AQp0xD2ZP7pEGCxUZis97vnwN3zLHj=nW-a-Y=bq6rT2Og@mail.gmail.com>
References: <CAE21AQp0xD2ZP7pEGCxUZis97vnwN3zLHj=nW-a-Y=bq6rT2Og@mail.gmail.com>
Message-ID: <20140512040630.GI4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Mon, May 12, 2014 at 01:32:21PM +1200, Charles Manning wrote:
> I don't quite understand why I need to set the kernel header version under
> Toolchain/Kernel headers.
> 
> Surely this can be figured out from the kernel source I am using?
> 
> Setting the version under toolchain/kernel headers makes sense when there
> is no kernel being built, but makes little sense when a kernel is buing
> built.
> 
> Having to set this in multiple places leads to inconsistency.
> 
> ... or have I misunderstood something?

There is a use case for using headers from a newer kernel than the running 
one. Consider, for example, userspace environment that needs to run under 
several kernels of different versions. In this case you generally want to use 
the latest headers for to allow userspace to take advantage of the most recent 
kernel you use. The same userspace programs should also run just fine on older 
kernels, since in most cases userspace fails gracefully when encountering an 
unsupported kernel feature.

You can always set BR2_LINUX_KERNEL_SAME_AS_HEADERS to simplify things for the 
single kernel case, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
