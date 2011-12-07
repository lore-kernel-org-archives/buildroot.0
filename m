From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Dec 2011 21:32:05 +0100
Subject: [Buildroot] [PATCH 3/3] xdm: install startup script
In-Reply-To: <1318238520-16580-3-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 10 Oct 2011 11:22:00
 +0200")
References: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
 <1318238520-16580-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <87ty5cazsq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> install S99xdm to /etc/init.d to start XDM automatically

Committed with small fixes, thanks.
 
 yegorslists> +define XAPP_XDM_INSTALL_STARTUP_SCRIPT
 yegorslists> +	$(INSTALL) -m 0755 package/x11r7/xapp_xdm/S99xdm $(TARGET_DIR)/etc/init.d/S99xdm

Remember to use install -D to ensure destination dir exists.

-- 
Bye, Peter Korsgaard
