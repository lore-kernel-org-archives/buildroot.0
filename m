From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:10:55 +0100
Subject: [Buildroot] [PATCH 06/17] i2c-tools: ensure binaries are
 installed in the right place
In-Reply-To: <1291802049-18764-7-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-7-git-send-email-llandwerlin@gmail.com>
Message-ID: <20101208201055.3debc42f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Dec 2010 10:53:58 +0100
llandwerlin at gmail.com wrote:

>  define I2C_TOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin

In some packages you're doing mkdir -p, in others $(INSTALL) -m 755 -d.
Maybe we should standardize on one or the other ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
