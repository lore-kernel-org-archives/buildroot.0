From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Aug 2012 21:06:33 +0200
Subject: [Buildroot] [PATCH] Clean kernel when "make linux-clean" is
 called
In-Reply-To: <1346077203-16144-1-git-send-email-sho@relinux.de>
References: <1346077203-16144-1-git-send-email-sho@relinux.de>
Message-ID: <20120827210633.608e9bfe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Aug 2012 16:20:03 +0200,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> +linux-clean:
> +	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) clean

No, you should be implementing LINUX_CLEAN_CMDS instead of overriding
the linux-clean target, which is declared by the generic-package
infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
