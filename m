From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Apr 2013 23:30:21 +0200
Subject: [Buildroot] [PATCH v5 7/7] package: Introduce NOMMU symbol
In-Reply-To: <1365761909-15305-7-git-send-email-sonic.adi@gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-7-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130416233021.30c4486c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 12 Apr 2013 18:18:29 +0800, Sonic Zhang wrote:

>  ifeq ($(BR2_BINFMT_FLAT),y)
>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
> +
> +ifneq ($(BR2_USE_MMU), y)

There shouldn't be any space between the comma and the y.

> +TARGET_CFLAGS += -D__NOMMU__
>  endif
>  
>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)

And you're adding a ifneq condition without adding any endif. Smells
like untested code :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
