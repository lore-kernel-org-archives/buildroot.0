From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 23:45:08 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-base: depend on orc if it
	is enabled
In-Reply-To: <1310628760-4172-3-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Thu, 14 Jul 2011 09:32:40 +0200")
References: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
 <1310628760-4172-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87fwlvuzdm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  .../gst-plugins-base/gst-plugins-base.mk           |    4 ++++
 Sven>  1 files changed, 4 insertions(+), 0 deletions(-)

 Sven> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
 Sven> index 79ced30..09e0729 100644
 Sven> --- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
 Sven> +++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
 Sven> @@ -26,6 +26,10 @@ GST_PLUGINS_BASE_CONF_OPT = \
 
 Sven>  GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
 
 Sven> +ifeq ($(BR2_PACKAGE_ORC),y)
 Sven> +GST_PLUGINS_BASE_DEPENDENCIES += orc
 Sven> +endif

What does this buy us? Extra functionality or higher performance?

-- 
Bye, Peter Korsgaard
