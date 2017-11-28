From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Nov 2017 15:17:15 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/avahi: configure option
 pygtk was renamed to pygobject
In-Reply-To: <20171128130615.GG2889@scaer>
References: <20171127202700.28697-1-bernd.kuhls@t-online.de>
 <20171128130615.GG2889@scaer>
Message-ID: <20171128131715.cfuxo2ehjtpkvswy@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Nov 28, 2017 at 02:06:15PM +0100, Yann E. MORIN wrote:
> On 2017-11-27 21:27 +0100, Bernd Kuhls spake thusly:
> > See corresponding commit:
> > https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65
> > 
> > Fixes
> > http://autobuild.buildroot.net/results/1e9/1e974c814ae4236077a869339be1143a9af7e5cd/
> > http://autobuild.buildroot.net/results/010/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca/
> > http://autobuild.buildroot.net/results/572/5721634ffa2a4544a82dda08c1fcea331ecdadaf/
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/avahi/avahi.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> > index b89887b4c7..c8f1af9a9d 100644
> > --- a/package/avahi/avahi.mk
> > +++ b/package/avahi/avahi.mk
> > @@ -77,7 +77,7 @@ AVAHI_CONF_OPTS = \
> >  	--disable-gtk \
> >  	--disable-gtk3 \
> >  	--disable-gdbm \
> > -	--disable-pygtk \
> > +	--disable-pygobject \
> 
> This is incorrect, because then this disables the full python support.
> 
> So, either we do without python-gobject and we remove all the python
> handling in avahi.mk, or we bump python-gobject and fix the dependency
> chain.

Newer versions of python-gobject depend on GObject introspection. Buildroot 
does not currently support introspection.

  http://lists.busybox.net/pipermail/buildroot/2017-February/184645.html

Cross compiling introspection is a painful exercise:

  http://patchwork.ozlabs.org/patch/828791/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
