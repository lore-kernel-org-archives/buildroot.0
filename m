From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:32:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] reaver: fix build errors with static
 lib
In-Reply-To: <1524412319-6836-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1524412319-6836-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180425223236.1cf3befe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Apr 2018 17:51:59 +0200, Guillaume W. Bres wrote:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

This commit log was way too short, and lacked a reference to the
autobuilder failure being fixed. I've fixed that when applying.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +REAVER_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
> +REAVER_CONF_OPTS += LDFLAGS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"

Other issues/improvements here:

 - We generally pass such variables in <pkg>_CONF_ENV

 - A single <pkg>_CONF_ENV assignment is enough

 - LDFLAGS shouldn't be overridden entirely: $(TARGET_LDFLAGS) still
   needs to be passed.

I've fixed those different problems, and applied. See the final commit
at:

  https://git.buildroot.org/buildroot/commit/?id=559416ffe2039d1cac94e348bd28e963adf008a4

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
