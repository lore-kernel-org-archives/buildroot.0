From: William Wagner <will_wagner@carallon.com>
Date: Thu, 04 Nov 2010 16:51:39 +0000
Subject: [Buildroot] [PATCH] Repair initramfs dependancies after move to
 fs
In-Reply-To: <20101104171659.3aaa4f94@surf>
References: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
	<20101104171659.3aaa4f94@surf>
Message-ID: <4CD2E49B.2070402@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/2010 16:16, Thomas Petazzoni wrote:
> Hello Will,
>
> I'm replying on this old patch that I acked back in April. But I now
> have one question. While I still agree on the changes on
> target/linux/Makefile* (now linux/linux.mk), I don't understand why the
> following change was needed:
>
>> diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
>> index 4a205d1..9aaf1b0 100644
>> --- a/fs/initramfs/initramfs.mk
>> +++ b/fs/initramfs/initramfs.mk
>> @@ -6,6 +6,12 @@
>>   #
>>   #############################################################
>>
>> +ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>> +INITRAMFS_TARGET:=initramfs-root
>> +else
>> +INITRAMFS_TARGET:= #nothing
>> +endif
> the INITRAMFS_TARGET variable isn't used anywhere in the current git.
> Isn't this code useless ? (I think it is, but I'd like to be sure).

Yes I think you are right. It looks like this was only needed with the 
old kernel build sequence, the new linux/linux.mk doesn't need it.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
