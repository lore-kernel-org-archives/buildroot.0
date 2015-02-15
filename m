From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Feb 2015 21:50:01 +0100
Subject: [Buildroot] [PATCH] autobuild-run: do not build cdrkit using an
 incompatible toolchain
In-Reply-To: <1424007332-29351-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424007332-29351-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150215215001.29c1c587@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sun, 15 Feb 2015 13:35:32 +0000, Vicente Olivert Riera wrote:

> +    # This MIPS uClibc toolchain fails to build the cdrkit package
> +    if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
> +        return False

So again this needs a test on BR2_STATIC_LIBS=y, otherwise you will
never be building cdrkit anymore with this toolchain, even in shared
library builds.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
