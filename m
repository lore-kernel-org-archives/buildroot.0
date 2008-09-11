From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 11 Sep 2008 17:36:36 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libid3tag
In-Reply-To: <20080907143143.1CEE03C664@busybox.net>
References: <20080907143143.1CEE03C664@busybox.net>
Message-ID: <COL102-W784A5B3F373C00E8246E38DC560@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apologies all,



Did first move and then committed second patch set (to fix most paths as did not want to do it all in one big bang set).

My SVN status says committed but buildroot repo says not.  

Think something network related caused a screw up (I use HTTP tunneling
etc to get through company firewall and it all went down during second
commit.)


Daniel Laird

danieljlaird at hotmail.com


> To: buildroot at uclibc.org
> From: jacmet at uclibc.org
> Date: Sun, 7 Sep 2008 07:31:43 -0700
> Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libid3tag
> 
> Author: jacmet
> Date: 2008-09-07 07:31:42 -0700 (Sun, 07 Sep 2008)
> New Revision: 23355
> 
> Log:
> libid3tag: don't depend on libmad
> 
> libid3tag doesn't use libmad.
> 
> Modified:
>    trunk/buildroot/package/audio/libid3tag/Config.in
>    trunk/buildroot/package/audio/libid3tag/libid3tag.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/audio/libid3tag/Config.in
> ===================================================================
> --- trunk/buildroot/package/audio/libid3tag/Config.in	2008-09-07 14:31:39 UTC (rev 23354)
> +++ trunk/buildroot/package/audio/libid3tag/Config.in	2008-09-07 14:31:42 UTC (rev 23355)
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LIBID3TAG
>  	bool "libid3tag"
>  	select BR2_PACKAGE_ZLIB
> -	depends on BR2_PACKAGE_LIBMAD
>  	help
>  	  ID3 tag reading library from the MAD project.
>  
> 
> Modified: trunk/buildroot/package/audio/libid3tag/libid3tag.mk
> ===================================================================
> --- trunk/buildroot/package/audio/libid3tag/libid3tag.mk	2008-09-07 14:31:39 UTC (rev 23354)
> +++ trunk/buildroot/package/audio/libid3tag/libid3tag.mk	2008-09-07 14:31:42 UTC (rev 23355)
> @@ -46,7 +46,7 @@
>  	cp -dpf $(STAGING_DIR)/usr/lib/libid3tag.so* $(TARGET_DIR)/usr/lib/
>  	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libid3tag.so*
>  
> -libid3tag: uclibc zlib libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
> +libid3tag: uclibc zlib $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
>  
>  libid3tag-source: $(DL_DIR)/$(LIBID3TAG_SOURCE)
>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

_________________________________________________________________
Get all your favourite content with the slick new MSN Toolbar - FREE
http://clk.atdmt.com/UKM/go/111354027/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080911/6323c6b1/attachment.htm 
