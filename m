From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 May 2012 23:19:01 +0200
Subject: [Buildroot] [PATCHv3 4/4] dnsmasq: bump to version 2.61 and
	enhance
In-Reply-To: <1336137407-25136-4-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 May 2012 10:16:47 -0300")
References: <1336137407-25136-1-git-send-email-gustavo@zacarias.com.ar>
 <1336137407-25136-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878vh580u2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump to dnsmasq version 2.61.
 Gustavo> Add new conntrack functionality: makes for more sturdy firewall setups.
 Gustavo> Make IDN build without libintl, it's no longer needed and problematic
 Gustavo> for other packages when there's no NLS support enabled.
 Gustavo> Locale support does require IDN so just build it when IDN=y.

 
 Gustavo>  ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 Gustavo> @@ -65,16 +78,17 @@ define DNSMASQ_ENABLE_DBUS
 Gustavo>  		$(DNSMASQ_DIR)/src/config.h
 Gustavo>  endef
 Gustavo>  endif
 Gustavo> -
 Gustavo> + 

You've introduced a trailing space. I've fixed that and committed,
thanks.

-- 
Bye, Peter Korsgaard
