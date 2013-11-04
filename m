From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Nov 2013 22:20:35 +0100
Subject: [Buildroot] [PATCH v2] Makefile: fix out-of-tree builds with
 multiple targets with 'all'
In-Reply-To: <OF6D0F4B79.3FF51701-ON86257C19.004D284E-86257C19.004EA170@rockwellcollins.com>
References: <1383474181-4372-1-git-send-email-yann.morin.1998@free.fr>
 <OF6D0F4B79.3FF51701-ON86257C19.004D284E-86257C19.004EA170@rockwellcollins.com>
Message-ID: <20131104212035.GD32603@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2013-11-04 08:18 -0600, Ryan Barnett spake thusly:
> Yann,
> 
> "Yann E. MORIN" <yann.morin.1998@gmail.com> wrote on 11/03/2013 04:23:01 
> AM:
> 
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > For out-of-tree builds, this use-case fails to build:
> >     $ make clean all
> > 
> > This is because 'all' is filtered-out in the Makefile wrapper, since
> > the wrapper itself has a 'all' target.
> > 
> > The 'all' target is just the usual naming for the default target in a
> > Makefile. In fact, the first target is the default one, so we can name
> > it whatever we want.
> > 
> > Rename the Makefile wrapper 'all' target to avoid name-clashing.
> 
> Could you please add a comment about fixing the bug I reported? I'll even 
> make it easy for you with having the comment below so you can copy and 
> paste :)
> 
> Fixes bug #6644 

Doh, yes, I'll repost with commit message fixed.

> If you add the comment above, I will give you this:
> 
> Tested-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
