From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Apr 2014 22:23:18 +0200
Subject: [Buildroot] [PATCH 01/20] package/libgles: rename the _HAS and
 _PROVIDES variables
In-Reply-To: <533EE0A9.40405@mind.be>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <7568529058fb1caf7ef8222cf0412749053d1fa1.1394482605.git.yann.morin.1998@free.fr>
 <533EE0A9.40405@mind.be>
Message-ID: <20140404202318.GC3282@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-04 18:41 +0200, Arnout Vandecappelle spake thusly:
> On 10/03/14 21:27, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > The basic rule for a package is to have its options named
> > after the package name. There is no reason this should not
> > also be the case for virtual packages.
> > 
> > Besides, this will allow us to switch libgles to use the
> > soon-to-be-introduced virtual-package infrastructure.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Mike Zick <minimod@morethan.org>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> 
>  It no longer applies as is (well, it applies but it is not 
> correct anymore; it misses the new mesa3d and xbmc). Instead, 
> the change should be done with:
> 
> git grep -l 'BR2_PACKAGE_\(HAS\|PROVIDES\)_OPENGL_ES' | xargs sed -i 's/BR2_PACKAGE_\(HAS\|PROVIDES\)_OPENGL_ES/BR2_PACKAGE_\1_LIBGLES/g'

That's basically how I did generate those patches (IIRC).

I have anyway already rebased this on top of current master.
I was waiting for things to settle down a bit before I re-submitted
an updated series.

>  Other than that it gets my ack.

Thanks. :-)

>  Same for the next 4 patches: use the automated change 
> and it gets my ack.
> 
>  Please apply soonish to avoid further changes.

Hehe! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
