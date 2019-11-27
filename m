From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2019 16:59:22 +0100
Subject: [Buildroot] [PATCH v2] linux: add option to select the CIP
 real-time kernel
In-Reply-To: <1574769573-28984-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 26 Nov 2019 12:59:33 +0100")
References: <1574769573-28984-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87lfs1l38l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

Hi,

 > +config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 > +	bool "Latest CIP RT SLTS version (4.19.72-cip10-rt4)"
 > +	help
 > +	  Same as the CIP version, but this is the PREEMPT_RT realtime
 > +	  variant.
 > +
 > +	  The CIP community plans to maintain 4.19 for security and
 > +	  bug fixes for more than 10 years.
 > +
 > +	  https://www.cip-project.org
 > +
 >  config BR2_LINUX_KERNEL_CUSTOM_VERSION
 >  	bool "Custom version"
 >  	help
 > @@ -124,6 +135,7 @@ config BR2_LINUX_KERNEL_VERSION
 >  	string
 >  	default "5.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 >  	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 > +	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION

So the two CIP variants are not even in sync? Annoying :/

-- 
Bye, Peter Korsgaard
