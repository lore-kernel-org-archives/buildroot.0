From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 May 2014 12:10:54 +0200
Subject: [Buildroot] [PATCH] libnss: Enable for MIPS64 n32 platforms
In-Reply-To: <1400752943-49138-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1400752943-49138-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140522121054.6898c229@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 22 May 2014 11:02:23 +0100, Vicente Olivert Riera wrote:

> -ifeq ($(BR2_ARCH_IS_64),y)
> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),yn)

This cannot work: when an option is disabled, its value is empty, not
'n'.

So:

# a comment here that explains the exception for MIPS_NABI32
ifeq ($(BR2_ARCH_IS_64),y)
ifeq ($(BR2_MIPS_NABI32),)
...
endif
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
