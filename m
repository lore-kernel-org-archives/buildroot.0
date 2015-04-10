From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Apr 2015 09:36:45 -0300
Subject: [Buildroot] [RFC PATCH v2 3/5] aarch64: ilp32: add ilp32
 compiler and linker flags
In-Reply-To: <1426672192-21041-4-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1426672192-21041-4-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <5527C3DD.6050401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2015 06:49 AM, Zhang Jian(Bamvor) wrote:

> +ifeq ($(BR2_AARCH64_ILP32)$(BR2_aarch64),yy)
> +TARGET_ABI += -mabi=ilp32 -Xlinker -maarch64linux32
> +endif
> +
> +ifeq ($(BR2_AARCH64_ILP32)$(BR2_aarch64_be),yy)
> +TARGET_ABI += -mabi=ilp32 -Xlinker -EB -Xlinker -maarch64linux32b
> +endif

Ok, but...

> -TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
> +TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS)) $(TARGET_ABI)

...you're throwing -mabi at ld, i don't think ld understands that and
would probably break other architectures like PowerPC e500.
Regards.
