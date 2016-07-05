From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 12:15:39 +0200
Subject: [Buildroot] [PATCH] uboot: fix build with old U-Boot versions
In-Reply-To: <1467451543-28926-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467451543-28926-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160705121539.64bdfd09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 11:25:43 +0200, Thomas Petazzoni wrote:
> Since commit 0dca644e443c8f28bfe5aa1c98201dc3b49e1165 ("boot/uboot: fix
> missing host-openssl for i.MX28 target"), we pass HOSTCFLAGS/HOSTLDFLAGS
> in the environment of U-Boot when building. This is needed to allow
> U-Boot to find the OpenSSL headers/libraries when they are
> needed. Unfortunately, this breaks the build with old U-Boot versions as
> the U-Boot Makefiles were not designed to have HOSTCFLAGS/HOSTLDFLAGS
> passed in, which causes some important CFLAGS from the U-Boot build
> system to be ignored.
> 
> To address this, we only pass HOSTCFLAGS/HOSTLDFLAGS when OpenSSL
> support is needed. We make the assumption that the OpenSSL requirement
> only exists in sufficiently recent U-Boot versions, for which passing
> HOSTCFLAGS/HOSTLDFLAGS work fine.
> 
> Reported-by: Carlos Santos <casantos@datacom.ind.br>
> Cc: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I applied a different version, where I use Arnout's suggestion of
simply passing HOST_CFLAGS in the HOSTCC variable.

See:

  https://git.buildroot.org/buildroot/commit/?id=1c2eb2684f54cc182783419f1a0f489f5d5ca808

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
