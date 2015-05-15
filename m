From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 15:37:05 +0200
Subject: [Buildroot] [git commit] libcap-ng: cannot be built with nios2
 CS 2014.05 toolchain
In-Reply-To: <20150514230014.126BC7FADF@busybox.osuosl.org>
References: <20150514230014.126BC7FADF@busybox.osuosl.org>
Message-ID: <20150515153705.37f9e610@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 15 May 2015 00:33:25 +0200, Peter Korsgaard wrote:

>  config BR2_PACKAGE_CONNMAN_OFONO
>  	bool "enable ofono support"
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng

I think you should have probably excluded
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 as well. I haven't
tested, but it's pretty likely that it will also break with this
toolchain.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
