From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jul 2015 01:06:55 +0200
Subject: [Buildroot] [PATCH v2] Add support for MIPS Codescape MTI GNU
	Linux toolchain
In-Reply-To: <20150723221000.GB3530@free.fr>
References: <1437675584-3604-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150723221000.GB3530@free.fr>
Message-ID: <55B1738F.9080805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On 24/07/15 00:10, Yann E. MORIN wrote:
> Still, I ahve a question for Thomas...
>
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index 5ce4d33..f762dbc 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -144,6 +144,8 @@ endif
>>   else
>>   ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>>   TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
>> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
>> +TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/2015.06-03/bin
>
> I wonder if we could not just use the _STRIP_COMPONENTS variable to get
> rid of that extra level...

That only work for regular packages living under $(TOPDIR)/package/.

I will send a patch to add the _STRIP_COMPONENTS for external 
toolchains, and then I will send a v3 of this one.

Regards,

Vincent.
