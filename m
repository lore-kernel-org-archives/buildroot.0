From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:26:51 +0200
Subject: [Buildroot] [PATCH 4/8] boot/arm-trusted-firmware: add EDK2 as
 BL33 option
In-Reply-To: <20200720212119.GE2296@scaer>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200719180727.28202-5-hi@senzilla.io>
 <20200720225941.796ff11c@windsurf.home>
 <20200720212119.GE2296@scaer>
Message-ID: <20200721092651.314d1501@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 23:21:19 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(EDK2_FD_NAME).fd  
> > 
> > So there is this reference to a variable of another package, which I'm
> > never sure if it works correctly. Yann, what is the rule again ? :-)  
> 
> If a variable is expanded at the time of '$(eval $(foo-package))', then
> you can't share variables bewtween packages.
> 
> That is the case for _VERSION for example, as that serves to create a
> make-dependency in the form;
> 
>     build-dir/foo-$(FOO_VERSION): some-dependencies
> 
> If however, avariable is expanded in the configure, build, install,
> etc... rules, then this is OK.
> 
> For example, cross-using a variable in a _CMDS or _HOOKS is OK.

OK, so the case of the EDK2_FD_NAME used by Dick in this patch series
is OK I guess.

> Finally, if you can *ensure* the ordering, by defining the variable
> before the fiels that uses it are included, then that is also OK.
> 
> This is the case for exampe for the qt5 packages, or for barebox, where
> the include order *has been written* to ensure that.

Yeah, that is the point I remember, it's the other one that is less
clear to me, i.e when ordering is not guaranteed, what you can/cannot
do.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
