From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 19:05:06 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <20190612164102.GA6917@t450s.lan>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
 <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
 <20190611081559.GA24465@t450s.lan>
 <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
 <20190612155844.GC2647@scaer> <20190612164102.GA6917@t450s.lan>
Message-ID: <20190612170506.GF2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2019-06-12 18:41 +0200, Gary Bisson spake thusly:
> On Wed, Jun 12, 2019 at 05:58:44PM +0200, Yann E. MORIN wrote:
[--SNIP--]
> > Why ditch the older one? People are almost certain to have scripts that
> > rely on it, and since the new one is not a drop-in replacement, we can
> > keep the old one.
> 
> Reasons behind that change were:
> 1- the current code keeps having build issues

14 build failures since it was introduced 1.5 years ago, that's not
really breaking all over the place either. ;-) Besides, it really
started to break in May this year, and they all happen on Xogium's
autobuilder. Bisecting should be relatively easy, there are only about
29 commits between 2019.05-rc1 (where it seems it was still working) and
1cbc8172 (the first known failure).

> 2- the upstream project doesn't accept any patch anymore [1]
> 3- all NXP releases now use this new version, it doesn't provide scripts
>    for the old tool any longer, even for imx6/7 releases [2]

Well, I'm not speaking about the upstream tools, but tools that people
will have written for their own use, which we may never have heard of.
If they use it, it works for them, so why remove it?

> 4- the code is ugly (Windows tool ported to Linux at some point)

When has upstream code quality been a concern for us? ;-)

> 5- this tool is pretty much useless without imx-uuc, right now imx-uuc
>    is working with both, but nothing is for sure about future uuc
>    releases.

Ah, that is indeed a good reason to drop it: if the imx-uuc, which we
ship for the target, needs to go hand-in-hand with mfgtools/uuu, then it
makes sense to even completely drop mfgtools.

This is actually the only reason that I find valid, and it is a
compeling reason.

So yes: rename the package to imx-uuu, and completely drop mfgtools.

Thanks for the detailed explanations!

Regards,
Yann E. MORIN.

> But if you feel strongly about maintaining that package on our own in BR
> let me know.
> 
> Regards,
> Gary
> 
> [1] https://github.com/NXPmicro/mfgtools/pull/104
> [2] https://www.nxp.com/webapp/Download?colCode=imx-yocto-L4.14.98_2.0.0_ga

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
