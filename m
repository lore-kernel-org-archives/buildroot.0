From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:21:36 +0100
Subject: [Buildroot] [PATCH] libscrypt: -fPIC is needed to build for MIPS
In-Reply-To: <20170314154002.43673-1-Vincent.Riera@imgtec.com>
References: <20170314154002.43673-1-Vincent.Riera@imgtec.com>
Message-ID: <20170314222136.3c33c3dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 15:40:02 +0000, Vicente Olivert Riera wrote:

> +# -fPIC is needed to build for MIPS
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +LIBSCRYPT_CFLAGS += -fPIC
> +endif

This is not really the proper fix, because:

 1. -fPIC is not only needed for MIPS.

 2. The Makefile already passes -fPIC, but it gets overridden because
    Buildroot passes its own CFLAGS.

So I believe the patch proposed by Stefan S?rensen at
http://patchwork.ozlabs.org/patch/738605/ is a more appropriate
solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
