From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Mon, 13 Apr 2015 18:06:47 +0800
Subject: [Buildroot] [RFC PATCH v2 3/5] aarch64: ilp32: add ilp32
 compiler and linker flags
In-Reply-To: <5527C3DD.6050401@zacarias.com.ar>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1426672192-21041-4-git-send-email-bamvor.zhangjian@huawei.com>
 <5527C3DD.6050401@zacarias.com.ar>
Message-ID: <552B9537.9020601@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015/4/10 20:36, Gustavo Zacarias wrote:
> On 03/18/2015 06:49 AM, Zhang Jian(Bamvor) wrote:
> 
>> +ifeq ($(BR2_AARCH64_ILP32)$(BR2_aarch64),yy)
>> +TARGET_ABI += -mabi=ilp32 -Xlinker -maarch64linux32
>> +endif
>> +
>> +ifeq ($(BR2_AARCH64_ILP32)$(BR2_aarch64_be),yy)
>> +TARGET_ABI += -mabi=ilp32 -Xlinker -EB -Xlinker -maarch64linux32b
>> +endif
> 
> Ok, but...
> 
>> -TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>> +TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS)) $(TARGET_ABI)
> 
> ...you're throwing -mabi at ld, i don't think ld understands that and
> would probably break other architectures like PowerPC e500.
Well, I guess it will only work for aarch64 because the BR2_AARCH64_ILP32.
Meanwhile, maybe I only need the "-Xlinker -EB -Xlinker -maarch64linux32b".
I will change it in my next version.

regards

bamvor
> Regards.
> 
