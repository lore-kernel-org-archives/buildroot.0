From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 22:30:51 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
 /etc/securetty
In-Reply-To: <1369599269-18876-1-git-send-email-spenser@gillilanding.com>
References: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
 <1369599269-18876-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130526223051.4c440f36@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sun, 26 May 2013 15:14:29 -0500, Spenser Gilliland wrote:

> Change-Id: Ifb1239c80eb86528345b24eb8d04b52b67aa1209

Please remove this.

> +target-generic-securetty:
> +	grep -q ^$(TARGET_GENERIC_GETTY)$ $(TARGET_DIR)/etc/securetty || \
> +		echo $(TARGET_GENERIC_GETTY) >> $(TARGET_DIR)/etc/securetty

I'm not a make/shell expansion guru. Does the ^ and $ propagate all the
well to the shell and into the regexp matched by grep?

> +ifneq ($(TARGET_GENERIC_GETTY), )

No space for the test:

ifneq ($(TARGET_GENERIC_GETTY),)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
