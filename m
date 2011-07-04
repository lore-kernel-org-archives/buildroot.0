From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jul 2011 21:04:31 +0200
Subject: [Buildroot] [PATCH 5/6] Rework the logging daemons startup
In-Reply-To: <1309355181-21048-5-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 Jun 2011 15:46:20 +0200")
References: <1309355181-21048-5-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <878vsd27gg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> The logging mechanism startup being in inittab, it isn't easy to
 Maxime> overcharge the default policy. With this patch, the startup of the
 Maxime> syslog daemon is moved to an init.d script, that can easily be
 Maxime> overwritten.

Committed with minor fixes, thanks.

 Maxime> +define BUSYBOX_INSTALL_LOGGING_SCRIPT
 Maxime> +	$(INSTALL) -m 0755 package/busybox/S01logging $(TARGET_DIR)/etc/init.d

Please always use install -D

-- 
Bye, Peter Korsgaard
