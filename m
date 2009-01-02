From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Jan 2009 10:02:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/socat
In-Reply-To: <20090102082932.46BD0769FA@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 2 Jan 2009 08\:29\:32 +0000 \(UTC\)")
References: <20090102082932.46BD0769FA@busybox.osuosl.org>
Message-ID: <877i5e2i9e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

Hi,

 ulf>  	  http://www.dest-unreach.org/socat/
 ulf> +if BR2_PACKAGE_SOCAT
 ulf> +config BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT
 ulf> +	string "CRDLY_SHIFT"
 ulf> +	default "9"
 ulf> +	help
 ulf> +	  Add configure variable
 ulf> +
 ulf> +config BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT
 ulf> +	string "TABDLY_SHIFT"
 ulf> +	default "11"
 ulf> +	help
 ulf> +	  Add configure variable

That's not very descriptive.
 
 ulf>  $(SOCAT_WORKDIR)/Makefile: $(SOCAT_DIR)/.unpacked
 ulf> @@ -30,6 +53,7 @@
 ulf>  	(cd $(SOCAT_WORKDIR); rm -rf config.cache; \
 ulf>  		$(TARGET_CONFIGURE_OPTS) \
 ulf>  		$(TARGET_CONFIGURE_ARGS) \
 ulf> +		$(SOCAT_CONFIGURE_OPTS) \
 ulf>  		$(SOCAT_DIR)/configure \
 ulf>  		--target=$(GNU_TARGET_NAME) \
 ulf>  		--host=$(GNU_TARGET_NAME) \

How about converting it to Makefile.autotools.in format while you're
at it?

-- 
Bye, Peter Korsgaard
