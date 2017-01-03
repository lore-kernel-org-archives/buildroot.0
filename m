From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jan 2017 13:37:31 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
In-Reply-To: <CALnvph0wzcSPGauyJ-SLfwTPf_sLLiwM=_Ac5=N2qysL7ZWS7Q@mail.gmail.com>
References: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
 <20161215214757.0eb1f3d8@free-electrons.com>
 <CALnvph3Kr5Rtc8W5FD_oJSRm58sU_gmkNGQfy+M11kCz8BG3TA@mail.gmail.com>
 <20161216154428.200e5378@free-electrons.com>
 <CALnvph0wzcSPGauyJ-SLfwTPf_sLLiwM=_Ac5=N2qysL7ZWS7Q@mail.gmail.com>
Message-ID: <20170103133731.7fa364e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 3 Jan 2017 10:56:45 +0100, Jesper B?kdahl wrote:
> > OK. The configure.ac script indeed checks for plugins-base, but not for
> > plugins-bad.  
> 
> In configure.ac line 245 we have:
> AG_GST_CHECK_MODULES([GST_CODEC_PARSERS],
>   [gstreamer-codecparsers-$GST_API_VERSION], [$GST_PBADREQ], [yes])
> 
> which is checking for gstreamer-codecparsers that is part of plugins-bad?

Hum, ok. I haven't checked myself, but if you say so, fine :-)

> > Could you have a look at the configure.ac script? It seems like it
> > supports multiple renderers, not only DRM. If you don't want to support
> > all of them because you don't use them, that's fine. But you should
> > then use the appropriate --enable/--disable options to enable the right
> > renderer, and disable the other ones.  
> 
> I can add conditional CONF_OPTS that adds --enable/--disable based on
> which renderers can be built e.g.:
> ifeq ($(BR2_PACKAGE_LIBDRM),y)
> GST1_VAAPI_CONF_OPTS += --enable-drm
> else
> GST1_VAAPI_CONF_OPTS += --disable-drm
> endif

You can do that, *or* if you don't need those renderers, simply disable
them unconditionally for now. The next user interested in one renderer
or the other can tweak the .mk file and send a follow-up patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
