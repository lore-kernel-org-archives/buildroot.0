From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Oct 2011 23:24:01 +0200
Subject: [Buildroot] [PATCH] noip: new package
In-Reply-To: <1318027141-1026-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Oct 2011 19:39:01 -0300")
References: <1318027141-1026-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87botrfa8e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> +NOIP_VERSION = 2.1.9
 Gustavo> +NOIP_SITE = http://www.no-ip.com/client/linux
 Gustavo> +NOIP_SOURCE = noip-duc-linux.tar.gz
 Gustavo> +
 Gustavo> +define NOIP_BUILD_CMDS
 Gustavo> +	sed -i -e "s:\(#define CONFIG_FILENAME\).*:\1 \"/etc/no-ip2.conf\":" \
 Gustavo> +		$(@D)/noip2.c
 Gustavo> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 Gustavo> +		PREFIX=/usr CONFDIR=/etc
 Gustavo> +endef
 Gustavo> +
 Gustavo> +define NOIP_INSTALL_TARGET_CMDS
 Gustavo> +	$(INSTALL) $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2

this should be install -D -m 0755 for proper permissions / handling of
skeleton without /usr/sbin.

I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
