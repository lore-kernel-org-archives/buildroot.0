From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Apr 2017 06:40:25 +0300
Subject: [Buildroot] [PATCH] Restore .git directory in git package
 downloads
In-Reply-To: <58f7f1456cc7e_21d33f8c269493f44696f@ultri3.mail>
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
 <58f7f1456cc7e_21d33f8c269493f44696f@ultri3.mail>
Message-ID: <20170420034025.kcbpz3nrhn3yylin@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

On Wed, Apr 19, 2017 at 08:22:45PM -0300, Ricardo Martincoski wrote:
> On Wed, Apr 19, 2017 at 01:00 AM, James Balean wrote:
> > +++ b/support/download/git
> > @@ -85,10 +85,6 @@ if [ ${recurse} -eq 1 ]; then
> >      _git submodule update --init --recursive
> >  fi
> >  
> > -# We do not need the .git dir; we keep other .git files, in case they
> > -# are the only files in their directory.
> > -rm -rf .git
> 
> This patch cannot be applied as-is because:
> 
> - it would make the tarballs for git packages not reproducible as the contents
>   now depend on the state of the remote server (i.e. in some cases a full clone
>   is needed; assume a tarball is generated, then a new commit is created in the
>   remote server in any branch, a new full clone with the same reference as
>   version would include that new commit and therefore the tarball is different);

Interesting. I think it is worth a mention in the comment. Removing .git is 
not just an optimization as the comment implies. It is necessary in order to 
verify the generated tarball.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
