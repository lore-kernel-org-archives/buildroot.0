From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 17:14:09 +0100
Subject: [Buildroot] [PATCH v4 1/7] boot/optee-os: new package
In-Reply-To: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190210171409.19775a52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Jan 2019 11:47:23 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> OP-TEE OS is maintained by the OP-TEE project. It provides an
> open source solution for development and integration of secure
> services for Armv7-A and Armv8-A CPU based platforms supporting
> the TrustZone technology. This technology enables CPUs to
> concurrently host a secure world as the OP-TEE OS and a non-secure
> world as a Linux based OS.
> 
> The OP-TEE project maintains other packages to leverage OP-TEE on
> Linux kernel based OSes. An OP-TEE interface driver is available
> in the Linux kernel since 4.12 upon CONFIG_OPTEE.
> 
> This change references in Buildroot the today's latest OP-TEE
> revision release tagged 3.4.0.
> 
> https://www.op-tee.org/
> https://github.com/OP-TEE/optee_os
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> 
> ---
> Changes v3 -> v4
>   - Upgrade from OP-TEE 3.3.0 to 3.4.0. No local patch required.

Applied to next with the following fixes:

    [Thomas:
     - pass CFG_ARM32_core=y when building for ARMv7, otherwise the build
       fails
     - add a check that verifies that BR2_TARGET_OPTEE_OS_PLATFORM is not
       empty
     - minor formatting fixes/adjustements.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
