From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Sep 2017 17:16:38 +0200
Subject: [Buildroot] [PATCH 7/9] arch/arm: add some non-cortex armv8a
	cores
In-Reply-To: <20170903160409.57196eed@windsurf.lan>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
 <3447db07fd4678fa60261dd0e400218072d33482.1504444617.git.yann.morin.1998@free.fr>
 <20170903160409.57196eed@windsurf.lan>
Message-ID: <20170903151638.GD2786@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-09-03 16:04 +0200, Thomas Petazzoni spake thusly:
> On Sun,  3 Sep 2017 15:17:47 +0200, Yann E. MORIN wrote:
> > Some need gcc-5, some gcc-6 and some gcc-7.
> > 
> > The thunderx familly does not build in 32-bit mode (gcc complains
> > that the CPU is unknown, and even gcc master only knows them as
> > aarch64-only).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  arch/Config.in.arm | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> 
> Series looks good, but on this one, I'm wondering: do we really want to
> add this long list of CPU cores, that most likely nobody is ever going
> to use with Buildroot ?

Well, I'm not sure, but I would not bet either...

I know for sure that some people are using Buildroot to build small
systems that they use as docker roots for example (they've spoken so
either on the list or on the IRC channel some time ago). Those are
mostly expected to run on server-class machines. The Thunder familly
of CPUs are just meant for those kind of server-class machines.

So I do see a direct use-case for adding the ThunderX familly of cores,
yes.

For the others, I'm not as positive, but I still added them while I was
at it. Not much additional work, except waiting for more tests to run...
;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
