From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:30:41 +0200
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: support external TA SDK
In-Reply-To: <20190517084556.12242-1-etienne.carriere@linaro.org>
References: <20190517084556.12242-1-etienne.carriere@linaro.org>
Message-ID: <20190601153041.6855248e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Fri, 17 May 2019 10:45:53 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> It happens that Buildroot is used to generate the embedded filesystem
> not not the boot images that which are built from another environment(s).

not not -> but not

that which -> which

> In such case OP-TEE SDK get built outside of Buildroot. This SDK is

get -> gets

> needed by other OP-TEE packages in Buildroot to generate .ta files.
> 
> This change introduces BR2_TARGET_OPTEE_OS_SDK_PATH for configuration
> to provide the path of an external OP-TEE SDK.
> 
> This configuration is mandated when neither BR2_TARGET_OPTEE_OS_CORE
> nor BR2_TARGET_OPTEE_OS_SDK are enable while BR2_TARGET_OPTEE_OS=y.

enable -> enabled

> 
> When BR2_TARGET_OPTEE_OS_SDK_PATH is defined, the build stage of
> optee-os copies the SDK file tree into optee-os build tree, for these
> to be installed during target/staging install.
> 
> With this change BR2_TARGET_OPTEE_OS_SERVICES no more selects
> BR2_TARGET_OPTEE_OS_CORE as .ta files can be build from external SDK.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

To be honest, I am not convinced we want to support such a special use
case. It makes the whole OP-TEE packaging more complicated. I don't
think we need to support use cases where some random part of the system
gets built by Buildroot, and another part is built externally.

So unless you can convince me that the use case is really important, I
would be tempted to not accepted this patch series. I'm Cc'ing a bunch
of other folks so that they can share their opinion.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
