From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 23:31:23 +0200
Subject: [Buildroot] [PATCH v5 5/7] package: Introduce package-specific
 BINFMT_FLAT options.
In-Reply-To: <1365761909-15305-5-git-send-email-sonic.adi@gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-5-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130416233123.09de9b9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 12 Apr 2013 18:18:27 +0800, Sonic Zhang wrote:

> +ifeq ($(BR2_BINFMT_FLAT),y)
> +TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
> +endif

I haven't tested this, but it follows Arnout suggestion, and I find it
quite nice. It just lacks some documentation update, but I'm otherwise
fine with this patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
