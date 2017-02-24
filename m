From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 17:18:52 +0100
Subject: [Buildroot] [PATCH] package/htop: not available for uClibc
 static builds
In-Reply-To: <1487950561-29105-1-git-send-email-yann.morin.1998@free.fr>
References: <1487950561-29105-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170224171852.60b0b57c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 16:36:01 +0100, Yann E. MORIN wrote:

> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_STATIC_LIBS),yy)
> +HTOP_CONF_OPTS += LIBS=-ldl
> +endif

Using libdl when BR2_STATIC_LIBS=y ? This seems odd, no ?

Is libdl even available on noMMU architectures that only support the
FLAT binary format ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
