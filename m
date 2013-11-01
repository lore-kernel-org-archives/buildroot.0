From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 13:17:53 +0100
Subject: [Buildroot] [PATCH 1/1] cryptsetup: Fix autobuild error
 http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/
In-Reply-To: <1383247852-32199-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1383247852-32199-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20131101131753.3afa675a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Thu, 31 Oct 2013 12:30:52 -0700, Clayton Shotwell wrote:

> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +CRYPTSETUP_CONF_ENV += LDFLAGS="-lintl"
> +endif

I don't think BR2_TOOLCHAIN_USES_UCLIBC is the right thing to use here.
You should use either BR2_NEEDS_GETTEXT_IF_LOCALE or BR2_NEEDS_GETTEXT,
depending on whether intl is needed unconditionally, or only when
locale support is enabled (which is most likely the case).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
