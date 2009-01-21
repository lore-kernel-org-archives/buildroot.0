From: Daniel Laird <danieljlaird@hotmail.com>
Date: Wed, 21 Jan 2009 15:56:30 +0000
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <87ocy0srp9.fsf@macbook.be.48ers.dk>
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
	<87ocy0srp9.fsf@macbook.be.48ers.dk>
Message-ID: <COL102-DS21A734A7B3DE9D3E1B2541DCD10@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok I will change to use select.

regarding:
laird> +comment "plugins with external dependencies (more to come)"
 laird> +

The package has a number of plugins with external dependencies the 5 I have
added are ones that seems to end up being built by default but then fail due
to missing dependencies (ESD being first culprit).  The others plugins I
have not added as I have not tested them yet and the out of box 'untar;
configure; make' did not try making them.  I was trying to limit the scope
of the change with RC being done. 

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of Peter Korsgaard
Sent: 2009 Jan 21 13:40
To: buildroot at uclibc.org
Subject: Re: [Buildroot] svn commit:
trunk/buildroot/package/multimedia/gst-plugins-good

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2009-01-21 13:33:21 +0000 (Wed, 21 Jan 2009)
 laird> New Revision: 24937

 laird> Log:
 laird> package/multimedia/gst-plugins-good/gst-plugins-good.mk
 laird> package/multimedia/gst-plugins-good/Config.in

 laird> gst-plugins-good does not build unless some package dependencies are
forced.
 laird> This patch allows you to turn off some of the plugins with these
dependencies and hides
 laird> others that require some packages (like PNG/JPEG)

 laird> Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>


 laird>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
 laird>  	bool "matroska"
 laird> +	depends on BR2_PACKAGE_BZIP2 && BR2_PACKAGE_ZLIB

I prefer to use select for library dependencies. How is the user
supposed to know that bzip2 and zlib needs to be enabled to even see
the matroska option.

 laird>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
 laird>  	bool "monoscope"
 laird> @@ -119,4 +120,25 @@
 laird>  	bool "wavparse (*.wav audio)"
 laird>  	default y
 
 laird> +comment "plugins with external dependencies (more to come)"
 laird> +

What is this comment supposed to mean? That these things don't build
right now?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
