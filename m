From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 16:14:49 +0100
Subject: [Buildroot] [PATCH] suport/download: force svn to be
 non-interactive
In-Reply-To: <5c06394b-324c-f7fe-77b5-53fc7eeedc76@dawncrow.de>
References: <20171103212216.11772-1-yann.morin.1998@free.fr>
 <5c06394b-324c-f7fe-77b5-53fc7eeedc76@dawncrow.de>
Message-ID: <20171105161449.2774486a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Nov 2017 15:46:14 +0100, Andr? Hentschel wrote:
> Am 03.11.2017 um 22:22 schrieb Yann E. MORIN:
> > Fixes:
> >     http://autobuild.buildroot.org/results/2af/2af7412846c576089f8596857ab8c81ac31c1bed/
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Andr? Hentschel <nerv@dawncrow.de>
> > ---
> >  support/download/svn | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/support/download/svn b/support/download/svn
> > index 77abf3d02d..9f27d71f86 100755
> > --- a/support/download/svn
> > +++ b/support/download/svn
> > @@ -33,6 +33,6 @@ _svn() {
> >      eval ${SVN} "${@}"
> >  }
> >  
> > -_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
> > +_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
> >  
> >  tar czf "${output}" "${basename}"
> >   
> 
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Such a Signed-off-by doesn't make sense, because you're not passing
the code to someone else. You probably wanted to give one (or several)
of the following:

 - Reviewed-by:
 - Tested-by:
 - Acked-by:

See the manual for the detailed definition of those tags.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
