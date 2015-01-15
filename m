From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 12:24:26 +0100
Subject: [Buildroot] [PATCH] autobuild-run: do not build python using a
 non-working toolchain
In-Reply-To: <1421319447-9659-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1421319447-9659-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150115122426.64e67772@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 15 Jan 2015 11:57:27 +0100, Vicente Olivert Riera wrote:

> +    # This MIPS uClibc toolchain fails to build the python package
> +    if 'BR2_PACKAGE_PYTHON=y\n' in configlines and \
> +       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.11.tar.bz2"\n' in configlines:

No, this is not good: we don't want to disable Python completely for
this toolchain. We want to disable it only for BR2_STATIC_LIBS=y
builds, because that's the only situation that's causing this problem.

Can you resend an updated patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
