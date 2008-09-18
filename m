From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Thu, 18 Sep 2008 03:28:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcre
In-Reply-To: <20080917213320.62BE93C670@busybox.net>
References: <20080917213320.62BE93C670@busybox.net>
Message-ID: <19549945.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


There are a number of files that require this 'editing'
xml2-config, xslt-config, freetype-config and now pcre-config off the top of
my head.

Maybe we could add to Makefile.autotools.in a check for
STAGINGDIR/usr/bin/$PKG-config
If it exists edit it 

What do you think?
Dan


Peter Korsgaard-3 wrote:
> 
> Author: jacmet
> Date: 2008-09-17 14:33:19 -0700 (Wed, 17 Sep 2008)
> New Revision: 23416
> 
> Log:
> pcre: fixup paths in pcre-config
> 
> Modified:
>    trunk/buildroot/package/pcre/pcre.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/pcre/pcre.mk
> ===================================================================
> --- trunk/buildroot/package/pcre/pcre.mk	2008-09-17 11:45:37 UTC (rev
> 23415)
> +++ trunk/buildroot/package/pcre/pcre.mk	2008-09-17 21:33:19 UTC (rev
> 23416)
> @@ -20,5 +20,8 @@
>  $(eval $(call AUTOTARGETS,package,pcre))
>  
>  $(PCRE_HOOK_POST_INSTALL): $(PCRE_TARGET_INSTALL_TARGET)
> +	$(SED) 's,^prefix=.*,prefix=$(STAGING_DIR)/usr,' \
> +		-e 's,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,' \
> +		$(STAGING_DIR)/usr/bin/pcre-config
>  	rm -rf $(TARGET_DIR)/usr/share/doc/pcre
>  	touch $@
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-pcre-tp19541579p19549945.html
Sent from the BuildRoot mailing list archive at Nabble.com.
