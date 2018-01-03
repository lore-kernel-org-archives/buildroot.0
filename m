From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 23:26:17 +0100
Subject: [Buildroot] [PATCH v4 1/1] tcfagent: new package
In-Reply-To: <20180102173925.3945-1-nolange79@gmail.com>
References: <20180102173925.3945-1-nolange79@gmail.com>
Message-ID: <20180103232617.796a1eea@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 18:39:25 +0100, Norbert Lange wrote:

> +config BR2_PACKAGE_TCFAGENT_ARCH
> +	string
> +	default "arm"        if BR2_arm || BR2_armeb
> +	default "a64"        if BR2_aarch64 || BR2_aarch64_be
> +	default "i686"       if BR2_i386 && BR2_ARCH="i686"
> +	default "i386"       if BR2_i386
> +	default "x86_64"     if BR2_x86_64
> +	default "powerpc"    if BR2_powerpc || BR2_powerpcle
> +	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
> +	default "microblaze" if BR2_microblaze || BR2_microblazeel

This package fails to build on Microblaze:

  http://autobuild.buildroot.net/?reason=tcf-agent-1.6.0

Seems like the Microblaze port is not complete. Perhaps we should
simply disable it, and you could report the issue to the upstream
developers ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
