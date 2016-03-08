From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Mar 2016 23:31:01 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <20160308231332.1fbef781@free-electrons.com>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
 <20160308221049.GB14289@free.fr>
 <20160308231332.1fbef781@free-electrons.com>
Message-ID: <20160308223101.GC14289@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-08 23:13 +0100, Thomas Petazzoni spake thusly:
> On Tue, 8 Mar 2016 23:10:49 +0100, Yann E. MORIN wrote:
> > This definitely does not look nice to me... :-(
> > 
> > What we could do, however, would be:
> > 
> >   - in external.mk:
> >         BR2_HAS_EXTRA_HELP = YES  # Whatever non empty
> > 
> >   - in the main Makefile:
> > 
> >         help:
> >             blabla our current help
> >             $(if $(BR2_HAS_EXTRA_HELP),echo "  - local-help  to get local help blabla)
> > 
> > which would be IMHO much much nicer and much much simpler...
> 
> But it doesn't allow PATCH 2/2.

Indeed, it does not, but I'll reply with an alternate proposal...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
