From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 08:38:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: fix fenv build
 failure on ARCv2 with glibc
In-Reply-To: <3fa86dc3-5825-96ed-3466-32862ef55088@mind.be>
References: <20171107211149.17617-1-bernd.kuhls@t-online.de>
 <20171107223752.3844357c@windsurf>
 <3fa86dc3-5825-96ed-3466-32862ef55088@mind.be>
Message-ID: <20171108083848.223b0089@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 00:24:50 +0100, Arnout Vandecappelle wrote:

>  Doesn't this work?
> 
> config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
> 	bool
> 	default y
> 	# blabla why
> 	depends on !BR2_archs38 || !BR2_TOOLCHAIN_USES_GLIBC
> 	# blabla why
> 	depends on !BR2_nios
> 	...
> 
>  I believe we use that construct elsewhere...

Absolutely. Not sure why I over-engineered the thing, your solution
should work perfectly fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
