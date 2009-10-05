From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Mon, 05 Oct 2009 14:00:48 +0200
Subject: [Buildroot] Question about libtool patching
In-Reply-To: <1254735012.5772.16.camel@sven>
References: <1254681602.25803.41.camel@coalu.atr>
	<1254681715.25803.42.camel@coalu.atr> <1254735012.5772.16.camel@sven>
Message-ID: <1254744048.25803.58.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lundi 05 octobre 2009 ? 11:30 +0200, Sven Neumann a ?crit :
> On Sun, 2009-10-04 at 20:41 +0200, Lionel Landwerlin wrote:
> > [PATCH] Prevent libtool patching before autoreconf when autoreconf is required
> > 
> > Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
> > ---
> >  package/Makefile.autotools.in |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
> > index c4c4b1c..d36c884 100644
> > --- a/package/Makefile.autotools.in
> > +++ b/package/Makefile.autotools.in
> > @@ -188,7 +188,8 @@ $(BUILD_DIR)/%/.stamp_extracted:
> >  $(BUILD_DIR)/%/.stamp_libtool_patch:
> >  	$(call MESSAGE,"Patching libtool")
> >  # if the package uses libtool, patch it for cross-compiling in buildroot
> > -	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
> > +	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES" -a \
> > +	"$($(PKG)_AUTORECONF)" != "YES"; then \
> >  	for i in `find $(@D) -name ltmain.sh`; do \
> >  		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
> >  		done \
> 
> Totally makes sense to me and we also ran into problems because of this.
> I have applied this in our tree and it seems to work fine. Actually, it
> finally fixed a long-standing problem :)
> 
> Tested-By: Sven Neumann <s.neumann@raumfeld.com>
> 
> 

Nice ! :)


-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
