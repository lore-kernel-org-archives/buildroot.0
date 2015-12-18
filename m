From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 23:30:31 +0100
Subject: [Buildroot] [PATCH 04/13 v2] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <20151218221141.GH27578@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <82f1af6280a8c913d3df331813dec4376fda2fb5.1450031251.git.yann.morin.1998@free.fr>
 <5671F164.3080504@mind.be> <20151218221141.GH27578@free.fr>
Message-ID: <20151218223031.GA10982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-18 23:11 +0100, Yann E. MORIN spake thusly:
> On 2015-12-17 00:19 +0100, Arnout Vandecappelle spake thusly:
> > On 13-12-15 19:35, Yann E. MORIN wrote:
[--SNIP--]
> > >   - second, we add a new rule, $(1)-legal-source which only
> > >     $(1)-all-source depends on, so that we only download it for a
> > >     top-level 'make source', not as part of the standard download
> > >     mechanism (i.e. only what is really needed to build).
> > > 
> > > This way, we can do a complete [0] off-line build and are still able to
> > > generate legal-info, while at the same time we do not incur any download
> > > overhead during a simple build.
> > > 
> > > Also, we previously downloaded the _ACTUAL_SOURCE_TARBALL when it was
> > > not empty. 
> > 
> >  I haven't tested, but according to me this code already did the right thing:
> > 
> > ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
> >     $$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
> > endif
> > 
> >  It is true, however, that the original code didn't handle the case where a
> > package explicitly declares ACTUAL_SOURCE_TARBALL to be empty.
> 
> Yes, everything was downloaded, even missing pieces.

Hmmm... I did not answer your question. I'm off-topic... OK, so now for
the real answer to your real question:

s/not empty/not equal to the _SOURCE/

But I'll improve the commit log in this respect.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
