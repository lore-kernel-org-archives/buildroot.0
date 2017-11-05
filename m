From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 15:54:38 +0100
Subject: [Buildroot] [PATCH] suport/download: force svn to be
 non-interactive
In-Reply-To: <5c06394b-324c-f7fe-77b5-53fc7eeedc76@dawncrow.de>
References: <20171103212216.11772-1-yann.morin.1998@free.fr>
 <5c06394b-324c-f7fe-77b5-53fc7eeedc76@dawncrow.de>
Message-ID: <20171105145438.GK2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2017-11-05 15:46 +0100, Andr? Hentschel spake thusly:
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
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Did you mean "Tested-by" or "Reviewed-by" instead?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
