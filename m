From: =?UTF-8?Q?Jesper_B=C3=A6kdahl?= <jbb@gamblify.com>
Date: Tue, 3 Jan 2017 10:56:45 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
In-Reply-To: <20161216154428.200e5378@free-electrons.com>
References: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
 <20161215214757.0eb1f3d8@free-electrons.com>
 <CALnvph3Kr5Rtc8W5FD_oJSRm58sU_gmkNGQfy+M11kCz8BG3TA@mail.gmail.com>
 <20161216154428.200e5378@free-electrons.com>
Message-ID: <CALnvph0wzcSPGauyJ-SLfwTPf_sLLiwM=_Ac5=N2qysL7ZWS7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> OK. The configure.ac script indeed checks for plugins-base, but not for
> plugins-bad.

In configure.ac line 245 we have:
AG_GST_CHECK_MODULES([GST_CODEC_PARSERS],
  [gstreamer-codecparsers-$GST_API_VERSION], [$GST_PBADREQ], [yes])

which is checking for gstreamer-codecparsers that is part of plugins-bad?

> Could you have a look at the configure.ac script? It seems like it
> supports multiple renderers, not only DRM. If you don't want to support
> all of them because you don't use them, that's fine. But you should
> then use the appropriate --enable/--disable options to enable the right
> renderer, and disable the other ones.

I can add conditional CONF_OPTS that adds --enable/--disable based on
which renderers can be built e.g.:
ifeq ($(BR2_PACKAGE_LIBDRM),y)
GST1_VAAPI_CONF_OPTS += --enable-drm
else
GST1_VAAPI_CONF_OPTS += --disable-drm
endif


Best Regards,

Jesper B?kdahl
Hardware/Software Developer
Gamblify
