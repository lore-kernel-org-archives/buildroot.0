From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 21:28:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-22
In-Reply-To: <20170223212030.2a6a10af@free-electrons.com>
References: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
 <20170223171655.GA3910@free.fr>
 <20170223184807.1deec0de@free-electrons.com>
 <20170223200631.GB3910@free.fr>
 <20170223212030.2a6a10af@free-electrons.com>
Message-ID: <20170223202802.GD3910@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-23 21:20 +0100, Thomas Petazzoni spake thusly:
> On Thu, 23 Feb 2017 21:06:31 +0100, Yann E. MORIN wrote:
> 
> > And now I seem to remember that we already questioned that some time in
> > the past...
> 
> Yes, I even asked on the pkg-config mailing list how we are supposed to
> handle such a situation, and they didn't had a very clear answer.

Yep, rigns a bell now. Thanks!

> But I guess we need to go ahead and tweak the DirectFB .pc files and
> add -lstdc++ in Libs.private. It's the most logical thing to do IMO.

Did so (hack) and it works. But really it still fails, because sdl.pc is
wrong now. Hacking it too.

So:

 1    hack directfb.pc to add -lstdc++ in the Libs.Private field
 2.a  hack sdl.pc to add direct in the Requires field
 2.b  hack sdl.pc to not add -ldirect et al. but rely on Requires (above).

Sorking on that...

Thanks for the guidance! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
