From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 May 2018 22:22:48 +0200
Subject: [Buildroot] [PATCH] arch: drop now useless support for FDPIC
In-Reply-To: <20180521215840.3ca959f5@windsurf>
References: <20180521161706.3151-1-yann.morin.1998@free.fr>
 <20180521215840.3ca959f5@windsurf>
Message-ID: <20180521202248.GE3453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-05-21 21:58 +0200, Thomas Petazzoni spake thusly:
> On Mon, 21 May 2018 18:17:06 +0200, Yann E. MORIN wrote:
> > Now that we dropped support for blackfin, we no longer have any
> > architecture that supports FDPIC, so BR2_ARCH_HAS_FDPIC_SUPPORT
> > is never selected, so we can't select BR2_BINFMT_FDPIC.
> > 
> > Drop all of that now.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> When I dropped Blackfin support, I wondered about dropping FDPIC
> support. But I know people are working on FDPIC support on ARM, so I
> wasn't sure it was useful to drop it now, and re-add it later on.

Oh, well, I was just "Eh, this is dead code, it's gonna birot. Better
burry it now  sit does not stink too much yet..." ;-)

But we can always git-revert that code later when/if FDPIC gets
resurected for another arch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
