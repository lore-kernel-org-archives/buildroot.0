From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 23:44:07 +0200
Subject: [Buildroot] [PATCHv2] package/ustr: don't run ldconfig
In-Reply-To: <2ca4eb6f-02b0-103b-70e8-88136c4787ad@mind.be>
References: <1471184013-29565-1-git-send-email-yann.morin.1998@free.fr>
 <2ca4eb6f-02b0-103b-70e8-88136c4787ad@mind.be>
Message-ID: <20160814214407.GE30771@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-14 22:13 +0200, Arnout Vandecappelle spake thusly:
> On 14-08-16 16:13, Yann E. MORIN wrote:
> > The ustr Makefile.in (as introduced by the Debian patch we apply), is
> > probably not parallel-safe:
[--SNIP--]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  However...
[--SNIP--]
> > diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> > index 174f055..1d629ab 100644
> > --- a/package/ustr/ustr.mk
> > +++ b/package/ustr/ustr.mk
> > @@ -23,5 +23,7 @@ USTR_INSTALL_STAGING = YES
> >  # 'all-shared' to the default 'all' rule.
> >  USTR_MAKE_OPTS = all all-shared
> >  
> > +USTR_MAKE_OPTS += LDCONFIG=/bin/true
> 
>  So you don't agree that it's better on one line?
> 
> USTR_MAKE_OPTS = LDCONFIG=/bin/true all all-shared

Indeed no, because it serves two different purposes: one specifies the
make targets, the other specifies a workaround for a deficient
buildsystem.

That way, it makes both stand out, and it's easier to see what to
change^Wfix in the future when upstream has applied the patches I sent
them. ;-)
Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
