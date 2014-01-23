From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jan 2014 19:15:04 +0100
Subject: [Buildroot] [git commit] arch: pass cpu option instead of tune
 option on ARM
In-Reply-To: <CACmBeS0dY9NiAPJCTzSQGSH_zx71HN00MJ6Xk0_jD8DjyDwBRw@mail.gmail.com>
References: <20131226222002.C88A59C1E4@busybox.osuosl.org>
 <CACmBeS0dY9NiAPJCTzSQGSH_zx71HN00MJ6Xk0_jD8DjyDwBRw@mail.gmail.com>
Message-ID: <20140123181504.GB3446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonas, All,

On 2014-01-23 16:31 +0100, Jonas Jensen spake thusly:
> Moving from snapshot 20131213 to 20140123 I noticed a warning that
> wasn't there before:
> 
> "warning: switch -mcpu=fa526 conflicts with -march=armv4 switch
> [enabled by default]"
> 
> That's where I started digging and found this commit.
> 
> In cases where -mcpu is set, buildroot doesn't actually need to set
> -march, correct?

Can you check you have this commit in your tree:
    2c1dc32: toolchain/external: fix wrapper by not passing conflicting flags

http://git.buildroot.org/buildroot/commit/toolchain/toolchain-external/ext-toolchain-wrapper.c?id=2c1dc32647eb308126b0ae80a91988059d39aa7b

This one should solve your issue.

If not, can you share your .config, so we can try to reproduce?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
