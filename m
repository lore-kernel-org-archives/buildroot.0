From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 13:46:45 +0100
Subject: [Buildroot] [PATCH] autobuild-run: Do not build civetweb with a
 known non-working external MIPS toolchain
In-Reply-To: <1418042095-29450-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418042095-29450-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141208134645.21b6db36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Dec 2014 12:34:55 +0000, Vicente Olivert Riera wrote:

> +    # This MIPS uClibc toolchain fails to build the civetweb package
> +    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
> +        return False

I have just updated the BR toolchains used by the autobuilders, so the
version is now 2014.11 and not 2014.08.

Maybe some other exceptions in the autobuild-run script need to be
updated as well.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
