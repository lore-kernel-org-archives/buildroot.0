From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 09:39:18 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-09-14
In-Reply-To: <CAGrGpJDdVmD6PkhrZJgpTJut7vdvbxhS0m5Tg2DXPJZS90Vv6g@mail.gmail.com>
References: <20180915060039.533E3207D4@mail.bootlin.com>
 <CAGrGpJDdVmD6PkhrZJgpTJut7vdvbxhS0m5Tg2DXPJZS90Vv6g@mail.gmail.com>
Message-ID: <20181006093918.750d4197@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Oct 2018 14:59:36 -0600, Peter Thompson wrote:

> Sorry I am so slow getting back.   I was on holidays most of Sept.

No problem.

> This problem (AFAIK) is the Buildroot configure which is failing is trying
> to build both SDL and SDL2 which are two incompatible versions of the same
> thing.
> 881 BR2_PACKAGE_SDL=y
> 904 BR2_PACKAGE_SDL2=y
> 
> What is being attempted to be configured and built here would never work
> (in my opinion).
> 
> We could try to automate buildroot so only one or the other is selectable.
>   It would mean adding "depends on !BR2_PACKAGE_SDL2"  and "depends on
> !BR2_PACKAGE_SDL"  to each of the packages Config.in.

I don't see any actual error in the autobuild report at
http://autobuild.buildroot.net/results/552817141d7eb0c5037114a4bc7d2d76de871285
that you're replying to.

Also, I believe SDL and SDL2 libraries have different names, so they
can co-exist in the same system. Hence, it doesn't seem like there is a
good reason to make them mutually exclusive.

Could you explain what in the autobuild report above makes you think it
is a SDL/SDL2 conflict ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
