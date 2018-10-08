From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Oct 2018 21:31:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <9062fe55-2457-66bf-48cc-74e787d95129@mind.be>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <20181008180230.53ab7972@windsurf> <20181008163233.GH2869@scaer>
 <9062fe55-2457-66bf-48cc-74e787d95129@mind.be>
Message-ID: <20181008193115.GI2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-10-08 21:21 +0200, Arnout Vandecappelle spake thusly:
> On 8/10/18 18:32, Yann E. MORIN wrote:
> > On 2018-10-08 18:02 +0200, Thomas Petazzoni spake thusly:
> >> However, I suppose it doesn't fix the problem when you have a
> >> recent version of libfdt installed on your system (through your
> >> distribution), that doesn't play well with those older Linux/U-Boot
> >> versions. Correct ?
> > Probably not, indeed, but that is still better (IMHO) than the few hacks
> > we already tried with -isystem or the likes, which do not really work
> > either...
>  As far as we tested it, [1] *does* really work.
> [1] http://patchwork.ozlabs.org/patch/964474/

No it does not. Please see commit 6f8162cf8c1abef7e0a4771fe0d6b26a28f5c2b6
which got reverted by 255b6f80d395ef048f46cfcf75dba690c56af657, and which
was supposed to fix a very similar issue...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
