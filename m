From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Aug 2014 18:53:55 +0200
Subject: [Buildroot] [PATCH 2/2] lightning: Added package
In-Reply-To: <20140812091015.GB20528@tarshish>
References: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
 <1407279610-15589-2-git-send-email-paul@crapouillou.net>
 <20140806031244.GN2322@tarshish> <53E625E3.7030707@crapouillou.net>
 <20140812091015.GB20528@tarshish>
Message-ID: <20140812185355.0c350816@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 12 Aug 2014 12:10:15 +0300, Baruch Siach wrote:

> If this package is not compatible with external toolchain (and so I suspect) 
> then it should depend on BR2_TOOLCHAIN_BUILDROOT.

Why do you think this package is not compatible with external
toolchain? Because of:

+ifeq ($(BR2_PACKAGE_BINUTILS),y)
+LIGHTNING_DEPENDENCIES += binutils
+LIGHTNING_CONF_OPT += --enable-disassembler
+endif

There's absolutely no problem in having the _target_ binutils package
enabled with external toolchains. So I don't see why this package would
be particularly problematic for external toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
