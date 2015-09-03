From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 3 Sep 2015 09:14:10 +0100
Subject: [Buildroot] [PATCHv5] Add support for MIPS Codescape MTI GNU
	Linux toolchain
In-Reply-To: <20150902225444.GE7845@free.fr>
References: <1441207287-37761-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150902225444.GE7845@free.fr>
Message-ID: <55E80152.2010909@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 09/02/2015 11:54 PM, Yann E. MORIN wrote:
> Vincent, All,
> 
> On 2015-09-02 16:21 +0100, Vicente Olivert Riera spake thusly:
>> - Add support for MIPS Codescape MTI GNU Linux toolchain
>> - Add a hash value
>> - Add logic to 'toolchain/helpers.mk' to allow the SYSROOT_DIR and
>>   ARCH_SYSROOT_DIR sit side by side instead of nested.
>> - Add logic for creating the side-by-side symlink as a post install
>>   hook.
>> - Add logic to allow Buildroot finding the toolchain binaries under
>>   $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-05/bin.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I've included that new toolchain in the series I just sent:
>     http://lists.busybox.net/pipermail/buildroot/2015-September/138624.html

great! I will give it a try.

> [--SNIP--]
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index 3cb59c6..7a3b1d7 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -144,6 +144,8 @@ endif
>>  else
>>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>>  TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
>> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
>> +TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-05/bin
> 
> I've dropped this hunk, since it is no longer needed now that we can use
> the generic extract commands with the strip-componnents.

Yes, perfect.

Thanks,

Vincent.

> Regards,
> Yann E. MORIN.
> 
