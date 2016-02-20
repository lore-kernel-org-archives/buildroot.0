From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2016 23:06:57 +0100
Subject: [Buildroot] [PATCH v4] qt5tools: new package
In-Reply-To: <20160219143219.GA30826@kwain>
References: <1454682615-3448-1-git-send-email-ps.report@gmx.net>
 <20160219143219.GA30826@kwain>
Message-ID: <20160220230657.46a13638@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Antoine Tenart,

On Fri, 19 Feb 2016 15:32:20 +0100, Antoine Tenart <antoine.tenart@free-electrons.com> wrote:

> Hello Peter,
> 
> I tested your patch to build the QT5 Linguistic Tools, and it worked
> well :)
> 

Thanks for testing...

> However I have one comment:
> 
> On Fri, Feb 05, 2016 at 03:30:15PM +0100, Peter Seiderer wrote:
> > +
> > +define QT5TOOLS_INSTALL_STAGING_CMDS
> 
> I think you need to call the 'install' target here, to install the QT5
> Tools cmake modules in the host directory:
> 
> 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> 

Thanks for the hint, will send an updated patch soon, mind to give the cmake
part a little test?

Regards,
Peter

> > +	$(foreach p,$(QT5TOOLS_INSTALL_STAGING_y), \
> > +		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(HOST_DIR)/usr/bin/$(p)$(sep))
> > +endef
> 
> Thanks,
> 
> Antoine
> 
