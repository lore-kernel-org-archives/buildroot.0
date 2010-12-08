From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:13:33 +0100
Subject: [Buildroot] [PATCH 14/17] pango: ensure startup script is well
 installed
In-Reply-To: <1291802049-18764-15-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-15-git-send-email-llandwerlin@gmail.com>
Message-ID: <20101208201333.7de8d5b8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Dec 2010 10:54:06 +0100
llandwerlin at gmail.com wrote:

>  define PANGO_INSTALL_INITSCRIPT
> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
>  	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
>  endef

We could also do it in one line:

 $(INSTALL) -m 755 -D package/pango/S25pango $(TARGET_DIR)/etc/init.d/S25pango

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
