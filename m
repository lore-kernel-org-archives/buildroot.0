From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jan 2013 12:56:41 +0100
Subject: [Buildroot] [PATCH] gst-plugins-base: make alsa plug-in
	configurable
In-Reply-To: <1356000566-32423-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Thu, 20 Dec 2012 11:49:26 +0100")
References: <1356000566-32423-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87bod3kfly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> It may be desirable not to use the alsa sink for playback
 Sven> even though alsa-lib is installed. So make this a configuration
 Sven> option. This also takes care of selecting the proper options
 Sven> for alsa-lib
 Sven> (BR2_PACKAGE_ALSA_LIB_MIXER and BR2_PACKAGE_ALSA_LIB_PCM).

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/multimedia/gst-plugins-base/Config.in           |    6 ++++++
 Sven>  package/multimedia/gst-plugins-base/gst-plugins-base.mk |    3 +--
 Sven>  2 files changed, 7 insertions(+), 2 deletions(-)

 Sven> diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
 Sven> index 5d82533..70d664d 100644
 Sven> --- a/package/multimedia/gst-plugins-base/Config.in
 Sven> +++ b/package/multimedia/gst-plugins-base/Config.in
 Sven> @@ -73,6 +73,12 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME
 
 Sven>  comment "plugins with external dependencies (there may be more available)"
 
 Sven> +config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
 Sven> +	bool "alsa (mandatory for audio playback)"
 Sven> +        select BR2_PACKAGE_ALSA_LIB
 Sven> +        select BR2_PACKAGE_ALSA_LIB_MIXER
 Sven> +        select BR2_PACKAGE_ALSA_LIB_PCM

select lines should also be indented with <tab>. I've fixed that and
committed, thanks.

-- 
Bye, Peter Korsgaard
