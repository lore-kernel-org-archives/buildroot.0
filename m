From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 20:57:58 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] open-plc-utils: fix build with static musl
In-Reply-To: <20181011182013.16467-1-fontaine.fabrice@gmail.com>
References: <20181011182013.16467-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011205758.72baa707@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 20:20:13 +0200, Fabrice Fontaine wrote:
> Pass TARGET_LDFLAGS to EXTRA_LDFLAGS to fix following issue:
> /home/buildroot/autobuild/run/instance-3/output/build/host-gcc-final-7.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1545: undefined reference to `raise'
> 
> Also pass TARGET_CFLAGS to EXTRA_CFLAGS and TARGET_CXXFLAGS to
> EXTRA_CXXFLAGS and move all these variables to
> OPEN_PLC_UTILS_MAKE_OPTS for readability
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Instead of passing -static to EXTRA_LDFLAGS, use TARGET_LDFLAGS
>  - pass TARGET_CFLAGS to EXTRA_CFLAGS
>  - pass TARGET_CXXFLAGS to EXTRA_CXXFLAGS

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
