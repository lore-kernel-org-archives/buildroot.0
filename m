From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 28 Jul 2008 10:52:41 +0200
Subject: [Buildroot] Makefile.autotools.in does not work
	wellwith	projects
In-Reply-To: <20080728085003.GA22274@cloud.net.au>
References: <1216910589.29392.18.camel@localhost>
	<20080725001242.GB25141@cloud.net.au>
	<80DE307AE1CF4656A7072295EA2408F8@aeglos>
	<20080727013317.GA1706@cloud.net.au>
	<1217234557.7955.8.camel@localhost>
	<20080728085003.GA22274@cloud.net.au>
Message-ID: <1217235161.7955.12.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2008-07-28 at 18:50 +1000, Hamish Moffatt wrote:
> On Mon, Jul 28, 2008 at 10:42:37AM +0200, Hans-Christian Egtvedt wrote:
> > On Sun, 2008-07-27 at 11:33 +1000, Hamish Moffatt wrote:

<snipp>

> > And two minutes later I have a RFC for this solution, see attached
> > patch.
> [..]
> >  # Install to target dir
> > -$(BUILD_DIR)/%/.stamp_target_installed:
> > +$(TARGET_DIR)/%/$($($(PKG)_NAME)_TARGET_INSTALLED_TOUCH_FILE):
> >  	$(call MESSAGE,"Installing to target")
> > -	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
> > +	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_DIR)/$($(PKG)_SUBDIR)
> [..]
> >  # define sub-target stamps
> > -$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
> > +$(2)_TARGET_INSTALL_TARGET =	$$(TARGET_DIR)/$$($(2)_TARGET_INSTALLED_TOUCH_FILE)
> 
> Will every package that uses Makefile.autotools.in need to be modified
> to define the target installed file? If so, would you like to prepare a
> large patch? :)

Not really, since I do not have knowledge about each package and what
they will need to depend on installed on target.

> Alternatively, perhaps $(2)_TARGET_INSTALL_TARGET could
> be fall back to the old definition if the new variable is not supplied,
> using some ifeq logic.
> 

Yes, there should be a fallback when the variable is not supplied. The
Makefile should print a warning message as well, demanding an update ;)

I'll see what I can figure out.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
