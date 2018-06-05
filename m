From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 18:15:46 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180605161546.GE2503@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-05 08:22 -0300, Carlos Santos spake thusly:
> > From: "Arnout Vandecappelle" <arnout@mind.be>
> > To: "Stefan Becker" <chemobejk@gmail.com>, "buildroot" <buildroot@buildroot.org>
> > Cc: "Yann Morin" <yann.morin.1998@free.fr>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> > Sent: Monday, June 4, 2018 7:21:10 PM
> > Subject: Re: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace host-mkpasswd with host-busybox
> 
> > On 01-06-18 15:30, Stefan Becker wrote:
> >> host-mkpasswd was a fork from whois to provide a host version of
> >> mkpasswd for the build. This has caused a maintenance headache.
> >> 
> >> Replace it with host-busybox which can provide "mkpasswd" functionality
> >> from own source code. That causes less hassle for different build
> >> platforms.
> > 
> > Just to be clear: does everybody agree that it is a good idea to use
> > weakly-random numbers as salt, rather than real random numbers like whois does?
> 
> Wouldn't it be better to add a host version of the whois package that
> installs mkpasswd, only?

That's what I initially suggested, but whois' mkpasswd uses some
optional glibc features, which have been disabled in some distros,
like Fedora28, which can then no longer build our mkpasswd. And our
own mkasswd is an extract from way back then, when we did not have
the whois package in busybox.

So, switching to host-whois is not an imporovement over the current
situation.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
