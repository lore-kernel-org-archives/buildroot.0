From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 20:39:57 +0100
Subject: [Buildroot] [PATCH 1/4] openjdk: new package
In-Reply-To: <20180207095110.GJ20598@australia.be.alcatel-lucent.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
 <20180206143952.12332-2-thomas.de_schampheleire@nokia.com>
 <20180206145203.GD20598@australia.be.alcatel-lucent.com>
 <29b7df93-fa74-d453-aa0f-7d21a33ed719@mind.be>
 <20180207095110.GJ20598@australia.be.alcatel-lucent.com>
Message-ID: <20180225193957.GE2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-02-07 10:51 +0100, Thomas De Schampheleire spake thusly:
> On Tue, Feb 06, 2018 at 11:15:14PM +0100, Arnout Vandecappelle wrote:
> >  You can achieve this locally by adding...
> > [snip]
> > >> +OPENJDK_MAKE_ENV += X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes \
> > >> +		    PULSE_NOT_NEEDED=yes \
> > 			    PLATFORM= JAVA_HOME= OS= \
> > >> +		    BUILD_LD="$(HOSTCC)"
> 
> For JAVA_HOME this indeed makes perfect sense.
> 
> However, OS and PLATFORM are more generic variables that may conflict with
> various packages. I have seen issues with 'OS' for other (proprietary 3rd party)
> packages as well, I think likewise for PLATFORM.
> 
> So, perhaps the change for OS and PLATFORM could become a separate patch for
> inclusion in Buildroot? Would you agree?

Well, you may try, but if it is about third-party, proprietary, private
packages, then my position is that those packages should ensure their
environent is clean, doing as Arnout suggested...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
