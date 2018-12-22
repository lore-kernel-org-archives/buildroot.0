From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Dec 2018 09:32:52 +0100
Subject: [Buildroot] [PATCH 0/2] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
In-Reply-To: <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
Message-ID: <20181222083252.GV24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2018-12-21 10:46 +0100, Andreas Naumann spake thusly:
> Am 07.12.18 um 19:10 schrieb Yann E. MORIN:
> >This two-patch series is my counter-proposal to Joel's path to try and
> >fix the issue:
> >     https://patchwork.ozlabs.org/patch/1009168/
> >
> >The first patch fixes the absolute symlinks, that were so far not
> >accounted for at all. A new helper scripts changes them into relative
> >symlinks.
> >
> >The second patch is the actual fix to the issue Joel's patch was trying
> >to solve. I believe it is a better and simpler solution, although I have
> >to admit the patsubst trickery is not obvious.
> 
> Thank you for these patches as they adress an SDK issue I have just found.
> I have applied them on top of 2018.11 and verified the link ./usr -> ./
> remains as is and is not changed into a dead link to
> ./arm-buildroot-linux-gnueabihf_sdk-buildroot/.
> 
> However, the check for symlinks pointing out of host/ showed to two issues
> originating in install steps of iptables and eudev. Both create links that
> point to system pathes.

Ok, thanks for the report! :-)

> I have locally made POST_STAGING_HOOKS to fix that but that's probably a non
> acceptable hack.

Indeed no, please see my reply to Joel's suggestion instead.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
