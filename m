From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 11:52:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo libglib2
In-Reply-To: <20090112102946.8FFE4766E4@busybox.osuosl.org>
	(thomasez@uclibc.org's message of "Mon\,
	12 Jan 2009 10\:29\:46 +0000 \(UTC\)")
References: <20090112102946.8FFE4766E4@busybox.osuosl.org>
Message-ID: <87zlhwhk4a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "thomasez" == thomasez  <thomasez@uclibc.org> writes:

 thomasez> Author: thomasez
 thomasez> Date: 2009-01-12 10:29:46 +0000 (Mon, 12 Jan 2009)
 thomasez> New Revision: 24791

 thomasez> Log:
 thomasez> May not be the right way to do it but I just don't want those docs.

 thomasez> +CAIRO_CONF_OPT = --disable-gtk-doc --with-html-dir=/dev/null
 thomasez> +
 thomasez>  ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 thomasez> -	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 thomasez> +	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb \
 thomasez> +		--disable-gtk-doc --with-html-dir=/dev/null
 thomasez>  	CAIRO_DEPENDENCIES_EXTRA = directfb
 thomasez>  endif

Adding those with += below would be nicer - E.G.:

+CAIRO_CONF_OPT += --disable-gtk-doc --with-html-dir=/dev/null

-- 
Bye, Peter Korsgaard
