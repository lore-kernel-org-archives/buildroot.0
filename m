From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jul 2016 18:34:46 +0200
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on
 distclean
In-Reply-To: <20160711032615.GJ3870@tarshish>
References: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
 <20160711032615.GJ3870@tarshish>
Message-ID: <20160711163446.GB3734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-07-11 06:26 +0300, Baruch Siach spake thusly:
> On Sun, Jul 10, 2016 at 11:55:49PM +0200, Yann E. MORIN wrote:
> > Currently, if the dl/ directory is the default location, it is removed
> > on distclean.
> > 
> > However, the dl/ directory is a precious location: it contains all the
> > tarballs downloaded so far, and some can be relatively huge, taking some
> > previous time to re-download, especially on slowish links.
> > 
> > Don't remove it on distclean. If the user really needs to regain some
> > space, leave it to him to clean this directory up manually.
> 
> Current Makefile help text for 'distclean' says:
> 
>   delete all non-source files (including .config)
> 
> Not deleting the dl/ directory is not consistent with this description, IMO.

Well, I do understand it the other way: non-source files are deleted,
but source files are not deleted.

And I would argue that the content of dl/ *are* source files. If
anything, they are the archetype of source files.

Ergo, distclean should not remove them.

Regards,
Yann E. MORIN.

> baruch
> 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  Makefile | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 027f21c..5d840f6 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -901,9 +901,6 @@ clean:
> >  		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
> >  
> >  distclean: clean
> > -ifeq ($(DL_DIR),$(TOPDIR)/dl)
> > -	rm -rf $(DL_DIR)
> > -endif
> >  ifeq ($(O),output)
> >  	rm -rf $(O)
> >  endif
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
