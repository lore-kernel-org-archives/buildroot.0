From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:14:20 +0200
Subject: [Buildroot] [PATCH 01/34] reproducibility: introduce config knob
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507151420.6500c06b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:48:57 +0200, Gilles Chanteperdrix wrote:
> Making the builds reproducible involves turning off build timestamps,
> which some users may find annoying. So make the reproducible builds
> optional.

Missing SoB, as I said.

Originally, I thought "why make this optional", but I indeed understand
that for some use cases, not having timestamps might be annoying. So I
guess making this optional is the best option.

>  
> +config BR2_REPRODUCIBLE
> +	bool "Try and remove all sources of non-reproducibility from the build"

This should probably be:

	bool "Make the build reproducible (experimental)"
	help
	  This option will remove all sources of non-reproducibility
	  from the build process. For a given Buildroot configuration,
	  this allows to generate exactly identical binaries from one
	  build to the other, including on different machines.

	  This is labeled as an experimental feature, as not all
	  packages behave properly to ensure reproducibility.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
