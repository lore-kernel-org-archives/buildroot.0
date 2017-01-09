From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 13:16:51 +0100
Subject: [Buildroot] [PATCH RESEND v3] gst1-plugins-bad: Add kmssink
	support
In-Reply-To: <1483877905-18606-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Sun, 8 Jan 2017 10:18:25 -0200")
References: <1483877905-18606-1-git-send-email-festevam@gmail.com>
Message-ID: <87r34co2bw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Add support for the KMS video sink element. From the Gstreamer 1.10
 > release notes:

 > "New element kmssink to render video using Direct Rendering Manager (DRM)
 > and Kernel Mode Setting (KMS) subsystems in the Linux kernel. It is oriented
 > to be used mostly in embedded systems."

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>
 > ---
 > Changes since v2:
 > - Fix dependency comments
 > Changes since v1:
 > - Select libdrm and depends on BR2_TOOLCHAIN_HAS_THREADS

 >  package/gstreamer1/gst1-plugins-bad/Config.in           | 7 +++++++
 >  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 +++++++
 >  2 files changed, 14 insertions(+)

 > diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
 > index 16c0b7e..5c3ccd5 100644
 > --- a/package/gstreamer1/gst1-plugins-bad/Config.in
 > +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
 > @@ -549,6 +549,13 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 >  	help
 >  	  Fragmented streaming plugins
 
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS
 > +	bool "kmssink"
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS #  libdrm -> libpthread-stubs

This depends on is not strictly needed as gstreamer1 already depends on
threads, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
