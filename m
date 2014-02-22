From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:35:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] mpg123: needs MMU
In-Reply-To: <1393100684-5488-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Sat, 22 Feb 2014 21:24:44 +0100")
References: <1393100684-5488-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87y512sx6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > mpg123 needs MMU because the application that is built with this
 > package uses fork. Currently it is difficult to only build the
 > libraries for mpg123 so disabling the package all together when there
 > is no MMU support.

 > Note: mpg123 is an optional dependency of mpd but mpd already requires
 > BR2_USE_MMU so there is no need to add this as a dependency.

 > Fixes:
 >   http://autobuild.buildroot.net/results/5b0/5b053af566dd122ae7e58893e77d5d5f3070fb9e

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > ---
 > v1 -> v2
 >   - Added autobuild failure link

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > ---
 >  package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 >  package/mpg123/Config.in                      | 1 +
 >  2 files changed, 2 insertions(+)

 > diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
 > index 407bf31..3647e53 100644
 > --- a/package/gstreamer1/gst1-plugins-bad/Config.in
 > +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
 > @@ -400,6 +400,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 >  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
 >  	bool "mpg123"
 >  	select BR2_PACKAGE_MPG123
 > +	depends on BR2_USE_MMU # mpg123

All of gstreamer1 depends on mmu (because of glib), so this is not
really needed, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
