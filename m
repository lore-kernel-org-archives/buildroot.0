From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 15 Jan 2015 14:58:10 +0000
Subject: [Buildroot] [PATCH] autobuild-run: do not build python using a
 non-working toolchain
In-Reply-To: <20150115122426.64e67772@free-electrons.com>
References: <1421319447-9659-1-git-send-email-Vincent.Riera@imgtec.com>,
 <20150115122426.64e67772@free-electrons.com>
Message-ID: <38121FAB319C3344930C920E7B518313210694AC@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

yes, I will send an updated patch. Thanks.

Best regards,
--
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
________________________________________
From: Thomas Petazzoni [thomas.petazzoni at free-electrons.com]
Sent: 15 January 2015 11:24
To: Vincent Olivert Riera
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH] autobuild-run: do not build python using a non-working toolchain

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
