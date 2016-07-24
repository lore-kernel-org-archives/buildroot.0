From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:48:24 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add hidden symbol for PIE
 support
In-Reply-To: <20160711143513.GA6072@waldemar-brodkorb.de>
References: <20160711143513.GA6072@waldemar-brodkorb.de>
Message-ID: <20160724214824.57bf1db6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 16:35:14 +0200, Waldemar Brodkorb wrote:

> +ifneq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),y)

I've changed to positive logic instead:

ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)

> +	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE,)" \
> +	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE,)" \

The final comma was not needed.

Applied with those two changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
