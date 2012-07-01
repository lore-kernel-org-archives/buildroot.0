From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 1 Jul 2012 07:10:23 +0300
Subject: [Buildroot] Buildroot Udev Compiling
In-Reply-To: <006601cd56c2$0004c850$000e58f0$@jonas-keidel.de>
References: <19f6cb67d4b8fd0957ffd1ec1c9c4a2f@jonas-keidel.de>
 <4FEEF971.2000802@mind.be>
 <006601cd56c2$0004c850$000e58f0$@jonas-keidel.de>
Message-ID: <20120701041022.GA25705@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jonas,

On Sat, Jun 30, 2012 at 03:12:27PM +0200, Jonas Keidel wrote:
> >  I can't find the root cause of the problem (in fact, in my case it
> already fails when compiling attr), but my guess is that
> BR2_PREFER_STATIC_LIB is causing trouble.  Do you really need it?
> 
> Yes I really need it, because i build an special initramfs booting script
> and for that I need udev static build.
> But maybe it is possible to use it in another way. How can I do it? How can
> I implement udev in my busybox environment?

Busybox includes mdev which is a simplified udev. Note, however, that mdev 
relies on the old hotplug mechanism to get device information from the kernel 
at run-time. This hostplug mechanism is inherently racy. For the initramfs use 
case this should be enough, though.

You may also consider using devtmpfs.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
