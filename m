From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Oct 2018 18:32:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <20181008180230.53ab7972@windsurf>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <20181008180230.53ab7972@windsurf>
Message-ID: <20181008163233.GH2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-10-08 18:02 +0200, Thomas Petazzoni spake thusly:
> On Mon,  8 Oct 2018 13:51:46 +0200, Lothar Felten wrote:
> > Patch dtc to accept libfdt include guards with and without leading underscore.
> > A compiler warning is added to notify the user.
> > 
> > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> 
> So I guess this would fix the problem when host-dtc is built before
> some old Linux/U-Boot version.
> 
> However, I suppose it doesn't fix the problem when you have a
> recent version of libfdt installed on your system (through your
> distribution), that doesn't play well with those older Linux/U-Boot
> versions. Correct ?

Probably not, indeed, but that is still better (IMHO) than the few hacks
we already tried with -isystem or the likes, which do not really work
either...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
