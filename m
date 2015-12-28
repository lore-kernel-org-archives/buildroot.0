From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 09:20:19 +0100
Subject: [Buildroot] [PATCH] Handle defconfig as .config in .gitignore
 and distclean.
In-Reply-To: <20151227204416.GK3483@free.fr>
References: <555c49ac.0a64b40a.3499.ffffb3f0@mx.google.com>
 <530190200.250863.1432112666116.JavaMail.root@openwide.fr>
 <CABbD_XAgJWoQ5R6-01Enp37CP18i6fNgj6oCRB7uxvrkY4TmRA@mail.gmail.com>
 <20151227204416.GK3483@free.fr>
Message-ID: <20151228092019.5fb2af66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Dec 2015 21:44:16 +0100, Yann E. MORIN wrote:

> Unlike Jeremy, I'm perfectly fine with defconfig in .gitignore. It's the
> distclean part I'm more concerned with.
> 
> On the one hand, it does make sense to remove it like we do remove
> .config. After all, the user is king, and if he wants to remove
> everything, why should we keep it? ;-)
> 
> On the other hand, I would see defconfig as really the quintessence of
> the configuration, which the user explicitly saved. They could get quite
> surprised if we now remove that file.
> 
> So, I'm a bit skeptical either way: keep it or remove it, I am unsure.
> Let's lean toward the safe side, and ket's just keep it, for users that
> were used to that behaviour, OK?

Since the defconfig file name is configurable (by means of
BR2_DEFCONFIG), I don't think we should do anything special with it. So
I don't think it should be in .gitignore and I don't think we should
remove it upon "make distclean".

If we were do "rm -f $(BR2_DEFCONFIG)" to always remove the user
configured defconfig, then it would remove configs/<foo>_defconfig if
you started from that defconfig and do a "make distclean". Not good.
And we can't have user-configurable file names in .gitignore I believe.

So I'm personally in favor of keeping things as they are today, and
therefore reject the patch proposed by K?roly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
