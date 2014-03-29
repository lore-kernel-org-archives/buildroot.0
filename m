From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 10:32:08 +0100
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.7.
In-Reply-To: <20140329093520.5318ada7@skate>
References: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140329093520.5318ada7@skate>
Message-ID: <20140329093208.GA3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, Thomas, All,

On 2014-03-29 09:35 +0100, Thomas Petazzoni spake thusly:
> On Fri, 28 Mar 2014 17:31:05 +0100, Eric Le Bihan wrote:
> > Systemd needs Linux headers >= 3.7 because it uses IFLA_GRE_FLOWINFO
> > from linux/if_tunnel.h.
> > 
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  system/Config.in |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Are you sure Linux headers >= 3.7 are sufficient? I'm looking at the
> build failure at
> http://autobuild.buildroot.org/results/ad3/ad3b4003dc50582a493f1156234d83652104a6bf/build-end.log,
> and it looks like missing kernel definitions, even though the toolchain
> apparently uses 3.7 kernel headers, as far as I can see.

No, they were introduced in 3.8.

What's confusing is that the changesets were done on a v3.7-rc* tree,
so when one git-blames the affected file, checkouts the changeset with
the chagnes, and looks at Makefile, one will see 3.7-rc1. But they
eventually landed in 3.8.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
