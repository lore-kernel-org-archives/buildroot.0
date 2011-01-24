From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 09:53:37 +0100
Subject: [Buildroot] [PATCH 3rd RESEND 3/6] Add tidsp-binaries package
In-Reply-To: <1295822495-16972-4-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Mon, 24 Jan 2011 00:41:32 +0200")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-4-git-send-email-felipe.contreras@gmail.com>
Message-ID: <87y66ahecu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

Hi,

 Felipe> +++ b/package/multimedia/tidsp-binaries/Config.in
 Felipe> @@ -0,0 +1,6 @@
 Felipe> +config BR2_PACKAGE_TIDSP_BINARIES
 Felipe> +	bool "tidsp-binaries"
 Felipe> +	help
 Felipe> +	  TI OMAP3 DSP algorithms.
 Felipe> +
 Felipe> +	  https://gforge.ti.com/gf/project/openmax/

This only ever makes sense on ARM, so it should probably have a
depends on BR2_arm (and possible || BR2_armeb if that is possible with
this)

 Felipe> +++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
 Felipe> @@ -0,0 +1,9 @@
 Felipe> +TIDSP_BINARIES_VERSION=23.i3.8
 Felipe> +TIDSP_BINARIES_SOURCE=tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
 Felipe> +TIDSP_BINARIES_SITE:=http://gst-dsp.googlecode.com/files/
 Felipe> +
 Felipe> +define TIDSP_BINARIES_INSTALL_TARGET_CMDS
 Felipe> +	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 Felipe> +endef
 Felipe> +

Please add an uninstall target as well.

-- 
Bye, Peter Korsgaard
