From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Oct 2012 11:34:33 +0200
Subject: [Buildroot] [PATCH v9 02/10] perl: new package
In-Reply-To: <1349531633-26717-2-git-send-email-francois.perrad@gadz.org>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
 <1349531633-26717-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121008113433.4b4bcc1b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  6 Oct 2012 15:53:45 +0200, Francois Perrad wrote:

> +	select BR2_PACKAGE_HOST_QEMU

No longer needed.

> +define PERL_INSTALL_TARGET_CMDS
> +	$(MAKE) INSTALL_DEPENDENCE= \
> +		INSTALLFLAGS=-p \
> +		DESTDIR="$(TARGET_DIR)" \
> +		-C $(@D) install.perl
> +endef

In my target, I have about 2 MB of C header files in
usr/lib/perl5/5.16.1/linux-gnueabihf/CORE. I suspect they are not
really useful, right?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
