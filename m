From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 17:41:56 +0100
Subject: [Buildroot] [PATCH 2/4] Add gst-dsp package
In-Reply-To: <1297035905-29896-2-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Mon, 7 Feb 2011 01:45:03 +0200")
References: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
	<1297035905-29896-2-git-send-email-felipe.contreras@gmail.com>
Message-ID: <8762svx0dn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> +++ b/package/multimedia/gst-dsp/gst-dsp.mk
 Felipe> @@ -0,0 +1,19 @@
 Felipe> +GST_DSP_VERSION=0.8.0
 Felipe> +GST_DSP_SOURCE=gst-dsp-$(GST_DSP_VERSION).tar.gz
 Felipe> +GST_DSP_SITE=http://gst-dsp.googlecode.com/files/
 Felipe> +
 Felipe> +define GST_DSP_BUILD_CMDS
 Felipe> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
 Felipe> +endef
 Felipe> +
 Felipe> +define GST_DSP_INSTALL_TARGET_CMDS
 Felipe> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 Felipe> +endef
 Felipe> +
 Felipe> +define GST_DSP_UNINSTALL_TARGET_CMDS
 Felipe> +	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
 Felipe> +endef
 Felipe> +
 Felipe> +GST_DSP_DEPENDENCIES = gstreamer

You forgot tidsp-binaries, but I've added that. Committed, thanks.

-- 
Bye, Peter Korsgaard
