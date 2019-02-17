From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 22:51:41 +0100
Subject: [Buildroot] [PATCH v4 4/7] optee-test: new package
In-Reply-To: <1548845249-28201-4-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-4-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190217225141.0fdb7823@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jan 2019 11:47:26 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> +ifeq ($(BR2_aarch64),y)
> +OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
> +endif
> +ifeq ($(BR2_arm),y)
> +OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
> +endif

Second thought about this: this the SDK is installed by OPTEE-OS, it
should perhaps be boot/optee-os/optee-os.mk that provides a variable
pointing to the SDK. It can then be used by all packages that use the
SDK instead of duplicating this OPTEE-OS specific knowledge in all
users of the SDK.

Could you fix this by a set of follow-up patches ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
