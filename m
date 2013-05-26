From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 May 2013 23:00:25 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
In-Reply-To: <1369600825-19785-1-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Sun, 26 May 2013 15:40:25 -0500")
References: <1369599269-18876-1-git-send-email-spenser@gillilanding.com>
 <1369600825-19785-1-git-send-email-spenser@gillilanding.com>
Message-ID: <87ip25e9sm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> From: Tzu-Jung Lee <tjlee@ambarella.com>

 Spenser> We ran into a "Login incorrect" problem when running the same
 Spenser> rootfs image across platforms with different loging ports
 Spenser> ttyS0/1/2/3.

 Spenser> Simply assignning "console" to BR2_TARGET_GENERIC_GETTY_PORT,
 Spenser> which in turn modifies the /etc/inittab, is not enough because
 Spenser> the "console" device was missing in the /etc/securetty.

 Spenser> While current securetty has enumerated a lot of ttys, this
 Spenser> patch should save some efforts to enumerate more.

 Spenser> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Spenser> ---
 
 Spenser> +target-generic-securetty:
 Spenser> +	grep -q ^$(TARGET_GENERIC_GETTY)$$ $(TARGET_DIR)/etc/securetty || \
 Spenser> +		echo $(TARGET_GENERIC_GETTY) >> $(TARGET_DIR)/etc/securetty

I prefer to stick the TARGET_GENERIC_GETTY value inside single quotes to
ensure the shell won't get confused.

Committed to next with that corrected, thanks.

-- 
Bye, Peter Korsgaard
