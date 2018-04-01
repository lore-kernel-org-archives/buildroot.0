From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 18:43:44 +0200
Subject: [Buildroot] [PATCH v2 2/2] gst1-interpipe: new package
In-Reply-To: <20171027171622.16050-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 27 Oct 2017 19:16:22 +0200")
References: <20171027171622.16050-1-ps.report@gmx.net>
 <20171027171622.16050-2-ps.report@gmx.net>
Message-ID: <87tvsuri67.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - add hash for the license file
 > ---
 >  package/gstreamer1/Config.in                       |  1 +
 >  package/gstreamer1/gst1-interpipe/Config.in        | 10 +++++++++
 >  .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |  5 +++++
 >  .../gstreamer1/gst1-interpipe/gst1-interpipe.mk    | 24 ++++++++++++++++++++++
 >  4 files changed, 40 insertions(+)
 >  create mode 100644 package/gstreamer1/gst1-interpipe/Config.in
 >  create mode 100644 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
 >  create mode 100644 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk

 > diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
 > index aef75b55bf..ae7b982bf3 100644
 > --- a/package/gstreamer1/Config.in
 > +++ b/package/gstreamer1/Config.in
 > @@ -7,6 +7,7 @@ source "package/gstreamer1/gst1-plugins-good/Config.in"
 >  source "package/gstreamer1/gst1-plugins-bad/Config.in"
 >  source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 >  source "package/gstreamer1/gst1-imx/Config.in"
 > +source "package/gstreamer1/gst1-interpipe/Config.in"
 >  source "package/gstreamer1/gst1-libav/Config.in"
 >  source "package/gstreamer1/gst1-rtsp-server/Config.in"
 >  source "package/gstreamer1/gst1-validate/Config.in"
 > diff --git a/package/gstreamer1/gst1-interpipe/Config.in b/package/gstreamer1/gst1-interpipe/Config.in
 > new file mode 100644
 > index 0000000000..0a169e8d4f
 > --- /dev/null
 > +++ b/package/gstreamer1/gst1-interpipe/Config.in
 > @@ -0,0 +1,10 @@
 > +menuconfig BR2_PACKAGE_GST1_INTERPIPE
 > +	bool "gst1-interpipe"

It is a bit strange to use a menuconfig when there aren't any sub
options, so I've changed this to a normal config and applied, thanks.

-- 
Bye, Peter Korsgaard
