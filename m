From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 18:28:25 +0200
Subject: [Buildroot] [PATCH] infra/pkg-perl: use Backpan to get perl
 modules
In-Reply-To: <53A90984.3040502@mind.be>
References: <1403545341-24506-1-git-send-email-yann.morin.1998@free.fr>
 <53A90984.3040502@mind.be>
Message-ID: <20140624162825.GB3478@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-24 07:15 +0200, Arnout Vandecappelle spake thusly:
> On 23/06/14 19:42, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Old versions of some perl modules are aggressively pruned by their
> > authors, up to the point that only the latest version is available
> > for some modules.
> > 
> > OF course, that does not play very well for us, since we'd soon trip
> > on missing upstream versions.
> > 
> > As suggested br Fran?ois, switch over to using Backpan, that provides
> > all the versions (including current ones) of all the modules for an
> > apparently unlimited time (there are modules dating back 2005, at
> > least.)
> > 
> > Fixes:
> >     http://autobuild.buildroot.net/results/a95/a95064fbffc35d16e78dbb1e73c5bbfc262b8338/
> >     http://autobuild.buildroot.net/results/81c/81c00bd737ec37b7b44c1c3a4e1ca29b6d1281d2/
> >     http://autobuild.buildroot.net/results/5ce/5cebc74580c8a34bb63d82a7591269c9403e95af/
> >     [...]
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Fran?ois Perrad <francois.perrad@gadz.org>
> > ---
> >  Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Config.in b/Config.in
> > index bf1ca86..05f709d 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -242,7 +242,7 @@ config BR2_LUAROCKS_MIRROR
> >  
> >  config BR2_CPAN_MIRROR
> >  	string "CPAN mirror (Perl packages)"
> > -	default "http://search.cpan.org/CPAN"
> > +	default "http://backpan.perl.org/"
> >  	help
> >  	  CPAN (Comprehensive Perl Archive Network) is a repository
> >  	  of Perl packages. It has multiple software mirrors scattered
> > 
> 
>  I think it would be good to add the backpan explanation to the help text here.
> Otherwise, people may just configure a local CPAN mirror without understanding
> the consequences.

Well, this is moot, since this patch has been rejected, after the
comment by Fran?ois (as a reply to my earlier patch, see:
http://lists.busybox.net/pipermail/buildroot/2014-June/100038.html )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
