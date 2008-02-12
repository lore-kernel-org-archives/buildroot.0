From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 12 Feb 2008 11:38:05 +1100
Subject: [Buildroot] [ping] [patch] CONFIG_UPDATE for a few packages
In-Reply-To: <200802102331.m1ANVuFi015689@sallyv1.ics.uci.edu>
References: <200801041753.m04Hr3Pi011109@oogie-boogie.ics.uci.edu>
	<200802102331.m1ANVuFi015689@sallyv1.ics.uci.edu>
Message-ID: <20080212003805.GA12409@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 10, 2008 at 03:31:50PM -0800, Dan Nicolaescu wrote:
> I sent this patch over a month ago.  Nobody has made any comments, or
> applied it yet.
> The patch is pretty straight forward.... 

Your patch seems reasonable so I applied it.

> Is there a different way of submitting patches? Do I need to do
> something different?  Please let me know.

You can submit them to the bug/issue tracker on the web site.

>   > --- sed/sed.mk~
>   > +++ sed/sed.mk
>   > @@ -37,6 +37,7 @@
>   >  	mkdir -p $(HOST_SED_DIR)/bin
>   >  	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
>   >  	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
>   > +	$(CONFIG_UPDATE) $(SED_DIR1)/config
>   >  	touch $@
>   >  
>   >  $(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
>   > @@ -97,6 +98,7 @@
>   >  #############################################################
>   >  $(SED_DIR2)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
>   >  	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>   > +	$(CONFIG_UPDATE) $(SED_DIR2)/config
>   >  	touch $(SED_DIR2)/.unpacked
>   >  
>   >  $(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
>   > --- autoconf/autoconf.mk
>   > +++ autoconf/autoconf.mk
>   > @@ -24,6 +24,7 @@
>   >  
>   >  $(AUTOCONF_SRC_DIR)/.unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
>   >  	$(AUTOCONF_CAT) $(DL_DIR)/$(AUTOCONF_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
>   > +	$(CONFIG_UPDATE) $(AUTOCONF_SRC_DIR)
>   >  	touch $@

Unless you have an unusual host platform, it's not necessary to
$(CONFIG_UPDATE) for the autoconf host build.. but it's harmless so I
left it in.

Please send patches as attachments rather than in-line.

thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
