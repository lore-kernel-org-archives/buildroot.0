From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 23:00:33 +0200
Subject: [Buildroot] [PATCH 15/23 v5] docs/manual: allow documents to
 define some hooks, as for a package
In-Reply-To: <CAAXf6LUqdPr-XNXcsMRCT2jvfSRrPo3Y75FS1px7zaHx-pXM0A@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <23bf1e5cf8d3e8664077e5e85657193f1a363181.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LUqdPr-XNXcsMRCT2jvfSRrPo3Y75FS1px7zaHx-pXM0A@mail.gmail.com>
Message-ID: <20140924210033.GC3750@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-24 21:11 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Allow documents to define two hooks:
> >   - DOC_EXTRA_CHECK_DEPENDENCIES
> >     to check for extra dependencies required by this document
> >   - DOC_EXTRA_CHECK_DEPENDENCIES_FMT
> >     ditto, but for the specific format
> 
> Is this EXTRA_ string necessary?

I pondered that for a while, too. I'm not too fan of it, but I'd still
like that the user knows we already do some dependency checking.

But I'll remove it; we should just document that we already do basic
dependency checking.

> >   - DOC_POST_EXTRACT_HOOKS:
> >     to run additional actions to fill-in the build directory
> 
> I assume you called this POST_EXTRACT to line up with the package
> infras,

Yup.

> but for gendoc no extraction is done.
> In fact, an rsync of DOC_SOURCES is done. Doesn't it make more sense
> to use DOC_POST_RSYNC_HOOKS ?
> Such a hook also exists in pkg-generic, so it also lines up with the
> existing infras.

Ditto, I was not sure either way. I'll rename to RSYNC.

[--SNIP--]
> >  gendoc-check-dependencies-$(5):
> >  $(1)-check-dependencies-$(5): gendoc-check-dependencies-$(5)
> > +       $$(Q)$$(foreach hook,$$($(2)_CHECK_EXTRA_DEPENDENCIES_$(5)_HOOKS),$$(call $$(hook))$$(sep))
> 
> Here you didn't add the '# Single line' comment. Is that intentional?

I just forgot! ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
