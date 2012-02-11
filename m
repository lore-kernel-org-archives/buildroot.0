From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Feb 2012 17:58:49 +0100
Subject: [Buildroot] [PATCH 2/3] gst-plugins-base: add option to select
	'alsa'
In-Reply-To: <201202111705.26348.arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 11 Feb 2012 17:05:26 +0100")
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <1328918676-19482-3-git-send-email-felipe.contreras@gmail.com>
 <201202111705.26348.arnout@mind.be>
Message-ID: <878vk91f3q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  Keep the config options ordered alphabetically, so put it before OGG.

 Arnout>  Also, if the option exists, it should be used in the mk-file.  So add:

 Arnout> ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA),y)
 Arnout> GST_PLUGINS_BASE_CONF_OPT += --enable-alsa
 Arnout> else
 Arnout> GST_PLUGINS_BASE_CONF_OPT += --disable-alsa
 Arnout> endif

Indeed, people expect to be able to disable that option and not have the
alsa plugin built.

-- 
Bye, Peter Korsgaard
