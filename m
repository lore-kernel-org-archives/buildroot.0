From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Dec 2018 11:35:05 +0100
Subject: [Buildroot] Buildroot autobuilder: make[2]: c: Command not found
In-Reply-To: <20181205080628.GE11195@scaer>
References: <225065e1ea283f69952dae60f05daca8e93ebc27.camel@synopsys.com>
 <20181205080628.GE11195@scaer>
Message-ID: <20181205103505.GF11195@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2018-12-05 09:06 +0100, Yann E. MORIN spake thusly:
> On 2018-12-05 07:29 +0000, Alexey Brodkin spake thusly:
> > Just got a report about failed build, see
> > http://autobuild.buildroot.net/results/cb5/cb555a124bb3bdb9c5a3465673c21022d94cf2ca/
> > 
> > But there's definitely something strange there as instead of "gcc" command "c" gets executed,
> > see http://autobuild.buildroot.net/results/cb5/cb555a124bb3bdb9c5a3465673c21022d94cf2ca//build-end.log:
> > ------------------------>8-----------------------
> > c -o option.o -pipe -ffunction-sections -O2 -g  -I/home/buildroot/autobuild/run/instance-0/output/build/qt5base-5.6.3/qmake
> [--SNIP--]
> > make[2]: c: Command not found
> I've spun a build here to investigate. If I can't reproduce lcoally, I'll
> see to try and reproduce it on my autobuild instance.

Unsurprisingly, I was not able to reproduce on my machine, but it indeed
breaks systematically on my autobuilder (i.e. it is not a fluke or a
parallel build issue.

I reverted c2ea056a1b (package/qt5/qt5base: use ccache for building host
code) and qt5base now builds again.

I'm investigating...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
