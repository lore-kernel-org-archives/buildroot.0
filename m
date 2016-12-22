From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2016 23:59:36 +0100
Subject: [Buildroot] [PATCH v2] package/xen: Update to version 4.8.0
In-Reply-To: <1482445317-9435-1-git-send-email-alistair.francis@xilinx.com>
References: <1482445317-9435-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20161222235936.018f7807@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Dec 2016 14:21:57 -0800, Alistair Francis wrote:

> +TARGET_CONFIGURE_OPTS := $(subst CFLAGS=",APPEND_CFLAGS="-Wno-error ,$(TARGET_CONFIGURE_OPTS))

You seem to miss the very important fact that the variable namespace in
Buildroot is global. So when you change TARGET_CONFIGURE_OPTS here you
change it for *all* packages, not just yours.

What are you trying to do here? If you want to override the CFLAGS just
for Xen, you should do:

XEN_CONF_ENV = \
	CFLAGS="$(TARGET_CFLAGS) your custom cflags"

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
