From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 08:21:03 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: libgtk2
	multimedia/gst-plugins-base mul etc...
In-Reply-To: <20090118000558.DC88077108@busybox.osuosl.org>
	(thomasez@uclibc.org's message of "Sun\,
	18 Jan 2009 00\:05\:58 +0000 \(UTC\)")
References: <20090118000558.DC88077108@busybox.osuosl.org>
Message-ID: <877i4t2i74.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "thomasez" == thomasez  <thomasez@uclibc.org> writes:

 thomasez> Author: thomasez
 thomasez> Date: 2009-01-18 00:05:57 +0000 (Sun, 18 Jan 2009)
 thomasez> New Revision: 24896

 thomasez> Log:
 thomasez> Finish the gtk-doc stuff and start on the smae thing with LARGEFILE and NLS.

Thanks.

 thomasez> +++ trunk/buildroot/package/Makefile.autotools.in	2009-01-18 00:05:57 UTC (rev 24896)
 thomasez> @@ -249,6 +249,8 @@
 thomasez>  		--exec-prefix=/usr \
 thomasez>  		--sysconfdir=/etc \
 thomasez>  		$(DISABLE_DOCUMENTATION) \
 thomasez> +		$(DISABLE_NLS) \
 thomasez> +		$(DISABLE_LARGEFILE) \
 thomasez>  		$(QUIET) $($(PKG)_CONF_OPT)
 thomasez>  	$(Q)touch $@
 

 thomasez> Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
 thomasez> ===================================================================
 thomasez> --- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-17 10:11:12 UTC (rev 24895)
 thomasez> +++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 00:05:57 UTC (rev 24896)
 thomasez> @@ -75,7 +75,6 @@
 thomasez>  		--disable-glibtest \
 thomasez>  		--enable-explicit-deps=no \
 thomasez>  		--disable-debug \
 thomasez> -		--without-html-dir \
 thomasez>  		$(DISABLE_LARGEFILE) \

You could have gotten rid of that line as well.
 
 thomasez>  GST_PLUGINS_UGLY_CONF_OPT = \
 thomasez>  		$(DISABLE_NLS) \

And this one.

 thomasez> +++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-18 00:05:57 UTC (rev 24896)
 thomasez> @@ -23,9 +23,7 @@
 thomasez>  		$(DISABLE_LARGEFILE) \

And this.

 thomasez>  		--disable-examples \
 thomasez>  		--disable-tests \
 thomasez> -		--disable-failing-tests \
 thomasez> -		--disable-gtk-doc \
 thomasez> -		--without-html-dir
 thomasez> +		--disable-failing-tests

-- 
Bye, Peter Korsgaard
