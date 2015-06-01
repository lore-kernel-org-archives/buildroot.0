From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 1 Jun 2015 07:18:19 +0300
Subject: [Buildroot] [PATCH v3 0/2] Improve powerpc-utils with librtas
In-Reply-To: <20150601040529.GA10144@ocelot.ozlabs.ibm.com>
References: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
 <20150601040529.GA10144@ocelot.ozlabs.ibm.com>
Message-ID: <20150601041819.GT2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Mon, Jun 01, 2015 at 02:05:29PM +1000, Sam Bobroff wrote:
> Thanks again for the reviews. I think I've addressed all of the issues. Is
> there anything else I need to do?

Just wait for the maintainers to review/apply your patches. The backlog of 
patches is visible at http://patchwork.ozlabs.org/project/buildroot/list/, and 
as you can see it is quite long. You may help shortening this list by 
reviewing other patches from that list. As the list shortens your contribution 
will be considered sooner.

baruch

> On Tue, May 19, 2015 at 03:59:54PM +1000, Sam Bobroff wrote:
> > Many useful functions are missing from powerpc-utils when built by
> > buildroot, because they depend on librtas which is not included.
> > 
> > This set adds the librtas package, a small patch to fix a problem with
> > it's make install target, and tweaks the powerpc-utils config
> > to include it. This makes the following additional programs available
> > from powerpc-utils:
> > 
> > * uesensor
> > * set_poweron_time
> > * drmgr
> > * lsslot
> > * activate_firmware
> > * rtas_ibm_get_vpd
> > * serv_config
> > * rtas_event_decode
> > * sys_ident
> > 
> > Changes v2 -> v3:
> > Patch 2/2: powerpc-utils: optionally use librtas
> > 
> > Group "with" and "without" clauses.
> > 
> > Changes v1 -> v2:
> > Patch 1/2: librtas: new package
> > 
> > Remove redundant INSTALL_TARGET=yes.
> > Add patch description and patch signed-off-by.
> > Rename patch with correct prefix (0001-).
> > 
> > Patch 2/2: powerpc-utils: optionally use librtas
> > 
> > Make librtas support in powerpc-utils optional due to size concerns.
> > 
> > Sam Bobroff (2):
> >   librtas: new package
> >   powerpc-utils: optionally use librtas
> > 
> >  package/Config.in                                  |    1 +
> >  ...0001-librtas-install-librtas.so.1-symlink.patch |   31 ++++++++++++++++++++
> >  package/librtas/Config.in                          |    9 ++++++
> >  package/librtas/librtas.mk                         |   26 ++++++++++++++++
> >  package/powerpc-utils/Config.in                    |   18 ++++++++++++
> >  package/powerpc-utils/powerpc-utils.mk             |    8 ++++-
> >  6 files changed, 92 insertions(+), 1 deletion(-)
> >  create mode 100644 package/librtas/0001-librtas-install-librtas.so.1-symlink.patch
> >  create mode 100644 package/librtas/Config.in
> >  create mode 100644 package/librtas/librtas.mk

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
