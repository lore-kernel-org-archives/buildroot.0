From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 12:00:40 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <5441A0DF.20309@mind.be>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20141011162152.GA4254@free.fr>
 <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
 <5441A0DF.20309@mind.be>
Message-ID: <20141018100040.GA3858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-10-18 01:06 +0200, Arnout Vandecappelle spake thusly:
> On 16/10/14 14:38, Johan Oudinet wrote:
> > ** Fix ejabberd build system
> > ** ===================
> > The only solution i see is to create a buildroot package for every
> > ejabberd dependency, listed in rebar.config.script :
> > esip, goldrush, lager, p1_cache_tab, p1_iconv, p1_stringprep, p1_stun,
> > p1_tls, p1_utils, p1_xml, p1_yaml, p1_zlib, xmlrpc
> > Then, modify ejabberd package to not use rebar at all, or at least to
> > not call rebar get-deps. Thus, if I remove deps from the `all'
> > makefile rule and deps/.build from the `src' rule dependency, it might
> > work.
> > 
> > Do you have a better idea?
> 
>  Perhaps it's an option to run rebar in download-only mode in the download step?

The problem is that rebar is an executable bundled in the ejabberd
archive, so, we can't run it before we extract ejabberd... :-(

Unless we can switch to using an external rebar. Johan?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
