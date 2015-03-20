From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:15:46 +0100
Subject: [Buildroot] [PATCH 06/15] avahi: systemd cleanups
In-Reply-To: <1426787807-29510-7-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-7-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320141546.702ace0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Thu, 19 Mar 2015 13:56:38 -0400, Mike Williams wrote:

> +ifneq ($(BR2_PACKAGE_SYSTEMD),y)
> +AVAHI_EXTRA_CFLAGS += -DDISABLE_SYSTEMD
> +endif

This cannot work, since AVAHI_EXTRA_CFLAGS is not used by anything.

I'm surprised you got a Reviewed-by from Samuel and Steven with this
big issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
