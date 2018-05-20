From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 May 2018 16:23:11 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180519230311.6a3652fd@windsurf>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf>
Message-ID: <20180520142311.GA3453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-05-19 23:03 +0200, Thomas Petazzoni spake thusly:
> If we were to drop the *shipped files, it means we would have to build
> host-flex and host-bison prior to running any "make *config" command.
> This would be really annoying.

And would requier quite a rework of the main Makefile, since we do not
include that pcakge .mk files until we do have a .coinfig file. So
currently, we can't have host-{flex,bison} before we have a .config.

Regards,
Yann E. MORIN.

> Alternatively, we could decide to make
> "flex" and "bison" mandatory dependencies of Buildroot, and rely on the
> user to install them on the system rather than building them ourselves.
> The drawback of this is that we would no longer control which version
> of flex/bison gets used.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
