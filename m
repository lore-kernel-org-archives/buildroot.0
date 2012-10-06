From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 6 Oct 2012 23:03:38 +0200
Subject: [Buildroot] [PATCH] fb-test-app: new package
In-Reply-To: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
References: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20121006210338.GA3850@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

On Fri, Oct 05, 2012 at 03:31:39PM +0200, ludovic.desroches at atmel.com wrote:
> +define FB_TEST_APP_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/perf $(TARGET_DIR)/usr/bin/perf

This might collide with the Linux kernel's perf utility.

> +	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/rect
> +	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
> +	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/offset
> +endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
