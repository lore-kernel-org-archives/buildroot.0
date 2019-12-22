From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:08:01 +0100
Subject: [Buildroot] [PATCH] package/open2300: add hash file
In-Reply-To: <20191222105754.188b7bd2@windsurf>
References: <20191222083707.3448-1-heiko.thiery@gmail.com>
 <20191222105754.188b7bd2@windsurf>
Message-ID: <20191222100801.GR26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, Thomas, All,

On 2019-12-22 10:57 +0100, Thomas Petazzoni spake thusly:
> On Sun, 22 Dec 2019 09:37:08 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
> > - add sha256 tarball hash
> > - add sha256 license hash
> > 
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  package/open2300/open2300.hash | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 package/open2300/open2300.hash
> > 
> > diff --git a/package/open2300/open2300.hash b/package/open2300/open2300.hash
> > new file mode 100644
> > index 0000000000..913cccf4d2
> > --- /dev/null
> > +++ b/package/open2300/open2300.hash
> > @@ -0,0 +1,2 @@
> 
> We need a comment at the top of the file that says where the hashes come from.
> 
> > +sha256	f4239d2f16d52156586d06be38f06a3eb58168377e243a8de8720b66e33ddb8f  open2300-12.tar.gz
> 
> The source code for this package is fetched from Subversion. Are the
> tarballs we create out of SVN repositories reproducible ? I guess so,
> but let's loop in Yann Morin for some additional feedback on this.

Seeing the dance we do in the git backend, and that we don't do it in
the svn backend, I doubt the svn backend is reproducible...

Yet, I just checked, and I indeed get the same sha256 as Heiko provided
in this patch...

Which prompted me in lookig at it. And we are not getting it from the
svn repository, for the good reason that the repository is dead and
off-line.

Instead, we're getting in from s.b.o instead, and thus the reason why
the sha256 is reproducible...

Dang... :-(

So I suggest we do indeed add this hash, because in the end, that's
s.b.o providing it, so it is stable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
