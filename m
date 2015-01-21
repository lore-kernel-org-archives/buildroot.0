From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Jan 2015 19:19:54 +0100
Subject: [Buildroot] [PATCH 1/1] pppd: add config option to install
 scripts shipped with pppd's source
In-Reply-To: <54B802AD.2070701@zacarias.com.ar>
References: <1421195844-865-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <54B802AD.2070701@zacarias.com.ar>
Message-ID: <20150121181954.GI4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2015-01-15 15:10 -0300, Gustavo Zacarias spake thusly:
> On 01/13/2015 09:37 PM, Zoltan Gyarmati wrote:
> 
> > Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> > ---
> >  package/pppd/Config.in | 8 ++++++++
> >  package/pppd/pppd.mk   | 5 +++++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/package/pppd/Config.in b/package/pppd/Config.in
> > index b77d7b0..6933fcf 100644
> > --- a/package/pppd/Config.in
> > +++ b/package/pppd/Config.in
> > @@ -22,6 +22,14 @@ config BR2_PACKAGE_PPPD_RADIUS
> >  	help
> >  	  Install RADIUS support for pppd
> >  
> > +config BR2_PACKAGE_PPPD_INSTALL_SCRIPTS
> > +	string "Install these PPP scripts"
> > +	default ""
> > +	help
> > +	  Space delimited list to specify which scripts
> > +	  need to be installed from pppd source tree's
> > +	  scripts directory
> > +
> 
> Hi.
> Isn't just simpler to copy those scripts that are useful/have no extra
> dependencies (like bash, expect, perl)?
> Otherwise it's just like a post-build script.
> Regards.

I concur with Gustavo: just install them, conditionally to the required
package being enabled, like:

  - needs nothing? Install it.
  - needs bash? Install if bash is 'y'.
  - And so on...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
