From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 20:56:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] reaver: add missing dependency on
 non static lib.
In-Reply-To: <1524248835-4552-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1524248835-4552-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180420205635.4dc1958d@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 20:27:15 +0200, Guillaume W. Bres wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +REAVER_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
> +REAVER_CONF_OPTS += LDFLAGS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
> +endif

Are you sure you need both LIBS and LDFLAGS ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
