From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jun 2010 08:35:20 +0200
Subject: [Buildroot] [git commit master] file: bump version and migrate
 to autotargets
In-Reply-To: <20100608220138.82FF1909FC@busybox.osuosl.org>
References: <20100608220138.82FF1909FC@busybox.osuosl.org>
Message-ID: <20100609083520.09d5f9b2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Jun 2010 23:32:40 +0200
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> +$(FILE_TARGET_UNINSTALL):
> +	$(call MESSAGE,"Uninstalling")
> +	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
> +	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
> +	rm -f $(FILE_TARGET_INSTALL_TARGET) $(FILE_HOOK_POST_INSTALL)

Ah, I didn't catch this at the review phase. I'd like to get rid of
these ? old style ? way of overloading operations. You can do the same
in a new style way with:

define FILE_UNINSTALL_TARGET_CMDS
	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
endef

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
