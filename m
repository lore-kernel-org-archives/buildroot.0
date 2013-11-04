From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Nov 2013 22:05:09 +0100
Subject: [Buildroot] [PATCH] libvpx: needs thread support
In-Reply-To: <1383408297-17438-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Nov 2013 17:04:57 +0100")
References: <1383408297-17438-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y553q3ne.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.org/results/8de/8def7e54e4fecb7df350443824c00b53d1c61c01/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
 >  package/libvpx/Config.in                       | 4 ++++
 >  2 files changed, 8 insertions(+)

 > diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
 > index 3342208..a9308c7 100644
 > --- a/package/gstreamer1/gst1-plugins-good/Config.in
 > +++ b/package/gstreamer1/gst1-plugins-good/Config.in
 > @@ -335,9 +335,13 @@ comment "taglib needs a toolchain w/ C++"
 >  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 >  	bool "vpx (webm)"
 >  	select BR2_PACKAGE_LIBVPX
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
 >  	help
 >  	  VP8 plugin
 
 > +comment "libvpx needs a toolchain w/ threads"
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 > +

Gstreamer1 itself is a heavy user of threads (and therefor depends on
BR2_TOOLCHAIN_HAS_THREADS), so this comment is never going to be
visible, but ok.

-- 
Bye, Peter Korsgaard
