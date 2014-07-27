From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 14:34:18 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: enhance doc for
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y
In-Reply-To: <f8aa686b6618867afc2725a276beb75a63e8ca12.1406323367.git.yann.morin.1998@free.fr>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
 <f8aa686b6618867afc2725a276beb75a63e8ca12.1406323367.git.yann.morin.1998@free.fr>
Message-ID: <20140727143418.727a55e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 25 Jul 2014 23:28:14 +0200, Yann E. MORIN wrote:
> The BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y symbols can be used to denote the
> lowest required kernel headers version, but also the highest supported
> version. Document that.

I'm honestly really unsure about this. Kernel headers expose the kernel
to userspace API, and this API is supposed to be backward compatible.
Therefore, I don't see why we should document the idea of expressing on
dependency on a highest kernel header version.

The v4l2 example we had on freescale seems like an API that shouldn't
have been part of the kernel to userspace API, and therefore shouldn't
be used by userspace libraries/applications.

Therefore, I'm tempted to say no to this patch, but I'm interested to
be convince otherwise :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
