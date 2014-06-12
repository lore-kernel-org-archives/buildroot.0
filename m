From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Jun 2014 19:05:11 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: fix AM_PATH_LIBGCRYPT not found
In-Reply-To: <20140612091528.6d8f0c76@free-electrons.com>
References: <1402521982-31067-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140611213246.GC27579@free.fr>
 <20140612091528.6d8f0c76@free-electrons.com>
Message-ID: <20140612170511.GA3502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-12 09:15 +0200, Thomas Petazzoni spake thusly:
> On Wed, 11 Jun 2014 23:32:46 +0200, Yann E. MORIN wrote:
> > OK, so let me sum up the thing:
> >   - we can't use autoreconf because of 'ln --relative' which is not
> >     available everywhere
> >   - if we could use autoreconf, we would not need this gcrupt.m4 stuff
> 
> No, the opposite. We need to autoreconf to be able to patch our the 'ln
> --relative' calls. And to be able to autoreconf, we need this
> libgcrypt.m4 stuff.
> 
> To me, hacking around the 'ln --relative' problem is not a proper
> solution. Because the next time we need a patch for systemd that
> requires autoreconf (like if we backport a fix from upstream or another
> change), then we will be back to the current situation where autoreconf
> cannot be done with libgcrypt.m4.
> 
> So I agree with the solution proposed by Eric here to bundle the
> libgcrypt.m4 file.

OK, I'm fine with the solution. I was just pointing out that an
alternative existed, wihch looked less ugly to me. But OK.

I'll take some time to do a proper review on this patch a bit later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
