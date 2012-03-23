From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 23 Mar 2012 16:05:18 +0100
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host
 tool
In-Reply-To: <20120323155103.54f93fa3@skate>
References: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
 <20120323155103.54f93fa3@skate>
Message-ID: <20120323150517.GS444@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15:51 Fri 23 Mar     , Thomas Petazzoni wrote:
> Le Fri, 23 Mar 2012 15:37:34 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> 
> > +HOST_DTC_SOURCE =
> > +HOST_DTC_DEPENDENCIES = linux
> > +
> > +define HOST_DTC_INSTALL_CMDS
> > +    $(INSTALL) -D -m 0755 $(LINUX_DIR)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc
> > +endef
> 
> The problem is that this DTC binary is only built if CONFIG_DTC is
> selected in the kernel configuration. So if the selected kernel does
> not have this option enabled, the installation step of this package is
> going to fail.
> 
> I am not sure what to do here. Just let the user figure this out? Check
> the kernel .config to see if CONFIG_DTC is enabled, and if it isn't
> while this package is selected, error out with a nice explanation for
> the user? Simply ignore the installation if the dtc binary was not
> built?
dtc is always provuded with the kernel so why do you need it?

Best Regards,
J.
