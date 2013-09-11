From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Sep 2013 15:40:13 +0200
Subject: [Buildroot] [PATCH] nommu/flat: build packages with the correct
 FLAGS
In-Reply-To: <1378904024-14607-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378904024-14607-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130911154013.1dee2f28@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 11 Sep 2013 09:53:44 -0300, Gustavo Zacarias wrote:

>  ifeq ($(BR2_BINFMT_FLAT),y)
> +TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
> +	-Wl$(comma)-elf2flt)

Nitpicking, can't this be written:

TARGET_CFLAGS += -Wl$(comma)-elf2flt$(if $($(PKG)_FLAT_STACKSIZE),=-s$($(PKG)_FLAT_STACKSIZE))

not sure if it's more readable though.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
