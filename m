From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 11 Nov 2013 13:26:37 +0100
Subject: [Buildroot] [PATCH v8 RESEND 4/8] Makefile: add support for
 top-level parallel make
In-Reply-To: <52685078.5090207@mind.be>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-5-git-send-email-fabio.porcedda@gmail.com>
 <52685078.5090207@mind.be>
Message-ID: <CAHkwnC9Btt6Ogr=5TFLYipGfAf1e-UGXcN-tSVrRn-CaDDA+Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2013 at 12:40 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/10/13 11:34, Fabio Porcedda wrote:
>>
>> diff --git a/fs/common.mk b/fs/common.mk
>> index 4dab7ea..7698c53 100644
>> --- a/fs/common.mk
>> +++ b/fs/common.mk
>> @@ -42,7 +42,7 @@ define ROOTFS_TARGET_INTERNAL
>>   # extra deps
>>   ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if
>> $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if
>> $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if
>> $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
>>
>> -$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
>> +$$(BINARIES_DIR)/rootfs.$(1): target-finalize
>> $$(ROOTFS_$(2)_DEPENDENCIES)
>>         @$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
>>         $$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call
>> $$(hook))$$(sep))
>>         rm -f $$(FAKEROOT_SCRIPT)
>> @@ -86,7 +86,7 @@ rootfs-$(1)-show-depends:
>>   rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
>>
>>   ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
>> -TARGETS += rootfs-$(1)
>> +TARGETS_ROOTFS += rootfs-$(1)
>>   endif
>>   endef
>
>
>  Oh I forgot: you should also fix up initramfs and iso9660. They add
> themselves to TARGETS manually.

Done, thanks.

Best regards
-- 
Fabio Porcedda
