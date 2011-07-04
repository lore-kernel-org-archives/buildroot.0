From: Will Newton <will.newton@gmail.com>
Date: Mon, 4 Jul 2011 15:02:13 +0100
Subject: [Buildroot] [PATCH 5/6] gst-plugins-base: depend on orc if it
	is enabled
In-Reply-To: <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
 <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
Message-ID: <CAFbHwiSbwfbGKa-mKiXFq-HN6b0UnxB+P3tpJLgGzu2K7V9ziw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 4, 2011 at 2:54 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:

> ?GST_PLUGINS_BASE_CONF_OPT = \
> @@ -26,6 +26,10 @@ GST_PLUGINS_BASE_CONF_OPT = \
>
> ?GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
>
> +ifeq ($(BR2_PACKAGE_ORC),y)
> +GST_FFMPEG_DEPENDENCIES += orc
> +endif
> +

Also it looks like this should be setting GST_PLUGINS_BASE_DEPENDENCIES.
