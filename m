From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Jul 2011 17:22:46 +0300
Subject: [Buildroot] [PATCH] Mini-XML: new package
In-Reply-To: <20110713161655.5607235e@skate>
References: <c0733fd8bffa6150cd9efeb202da470a2fdf0137.1310564424.git.baruch@tkos.co.il>
 <20110713161655.5607235e@skate>
Message-ID: <20110713142245.GA3498@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 13, 2011 at 04:16:55PM +0200, Thomas Petazzoni wrote:
> Le Wed, 13 Jul 2011 16:40:46 +0300,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> > The added patch is a workaround for cross build as follows:
> > 
> > 	* disable run of a test binary at build time
> > 	* disable generation of documentation using the mxmldoc binary
> > 	* remove now non-existent entries from the install target
> > 	* disable strip when running install
> Can you put these explanations in the header of the patch + add your
> Signed-off-by line to this patch ?

OK.

> Just curious, what is this library useful for compared to expat,
> libxml2 or roxml ?

I don't know. It's quite small, ~40KB on PowerPC, thus suitable for embedded 
applications.  We use mini-xml here internally, so it's convenient to have it 
in Buildroot.

> > +MXML_CONF_OPT = --enable-shared
> This is not needed, it is passed automatically by Buildroot.

OK. I'll remove it.

Thanks for reviewing.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
