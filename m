From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 12:28:26 +0100
Subject: [Buildroot] [PATCH 06/21 RFC] package/gcc: add licensing
 information
In-Reply-To: <ac61c991794df8089b615aee810b018840e37cc8.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <ac61c991794df8089b615aee810b018840e37cc8.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <20151117122826.646069a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 16 Nov 2015 23:47:01 +0100, Yann E. MORIN wrote:

>  GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
> +GCC_LICENSE = \
> +	GPLv2+, GPLv3+, LGPLv2.1+ (w/ exception), LGPv3+ (w/ exception), \
> +	BSD-3c, MIT, BSL-1.0

What I dislike a bit with this is that we don't clearly differentiate
what goes on the target with what remains on the host. For many
companies, having GPLv3 or LGPLv3 stuff on the target is (unfortunately)
a no-go, so it would be good to make this clearer.

As per your implementation, such license information will only be part
of the "host packages" license information, while libgcc gets actually
installed in the target. To be honest, I am not entirely sure how to
handle this properly with our package infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
