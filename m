From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2014 16:37:45 +0100
Subject: [Buildroot] [PATCH v2 2/3] gst-fsl-plugins: fix plugins loading
In-Reply-To: <1414768749-15134-2-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
 <1414768749-15134-2-git-send-email-jezz@sysmic.org>
Message-ID: <20141031163745.6c757212@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 31 Oct 2014 16:19:08 +0100, J?r?me Pouiller wrote:

> +define GST_FSL_PLUGINS_FIX_LD_PATH
> +	$(INSTALL) -d $(TARGET_DIR)/etc/ld.so.conf.d
> +	$(INSTALL) -m 644 \
> +		package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf \
> +		$(TARGET_DIR)/etc/ld.so.conf.d

In a review of an earlier patch, Yann already suggested to do this in
one command using $(INSTALL) -D -m 644.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
