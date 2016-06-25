From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:28:55 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: cleanup of build options
In-Reply-To: <1466748741-6725-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1466748741-6725-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <20160625152855.49d5d9a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 08:12:21 +0200, Marcin Nowakowski wrote:

> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 046c2aa..0f9fb15 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -312,11 +312,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB
>  	help
>  	  Connects to a VNC server and decodes RFB stream
>  
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
> -	bool "liveadder"
> -	help
> -	  Adds multiple live discontinuous streams

When you remove an option, it should be in fact moved to
Config.in.legacy so that users who upgrade to a new Buildroot version
are properly warned of the removal of this option.

I've fixed this up, did some minor tweaks to the commit log, and
applied. Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
