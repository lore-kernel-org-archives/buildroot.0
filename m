From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2012 12:57:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-30
In-Reply-To: <20121231073503.B128B52C08C@lolut.humanoidz.org>
References: <20121231073503.B128B52C08C@lolut.humanoidz.org>
Message-ID: <201212311257.38291.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On Monday 31 December 2012 Thomas Petazzoni wrote:
> Build 3100464afbf26fa560a965d772f12b3fe38b101a
> ==============================================
> 
> Status         : NOK
> Failure reason : dvb-apps-3fc7dfa68484

Patch sent to the list to fix these issues.


> Build 578ca4ca409468a2e6e06f6919a7f7f2420c0a21
> ==============================================
> 
> Status         : NOK
> Failure reason : tvheadend-v3.3

These failures are due to a missing wordexp.h in the toolchain.
Indeed, the internal uClibc-based toolchain has wordexp support disabled.

I'm not sure how to solve this (not all proposals are exclusive):
  - add a new config-knob "Toolchain has wordexp", at the risk of having
    an ever-increasing number of toolchain-knobs,
  - change the internal uClibc configuration to enable wordexp
  - leave as-is, and expect the user to know what he/she is doing

I think we should do 2: packages in buildroot should at least all (except
maybe some platform-specific packages that may require an external
toolchain, eg. bfin and ?blaze) build with the internal toolchain
mechanism.

What do you think?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
