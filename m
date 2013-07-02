From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 2 Jul 2013 18:55:38 +0100
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <51D30004.7060200@mind.be>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
 <51D26C51.8070108@mind.be>
 <CAG2jQ8j2iucPz356Wkz8=xSOQ=QC2u_7ebZZimRhycBGu4_nvg@mail.gmail.com>
 <51D30004.7060200@mind.be>
Message-ID: <CAG2jQ8iqGmmMNn7v1ko7==gVxKGtjjmkrd26WD_6_K2hvk-Ukg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 July 2013 17:29, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/02/13 15:36, Markos Chandras wrote:

>> Is this preferred?
>>
>> +ifeq ($(BR2_MIPS_NABI64)$(BR2_aarch64)$(BR2_sh64)$(BR2_x86_64),)
>
>
>  I was going to say:
>
> ifeq ($(BR2_ARCH_IS_64),)
>
> but only now I realise you're talking about n32 on a 64-bit MIPS. Though I
> must say, I don't understand why we call it BR2_ARCH_IS_64 if the ABI is 32
> bit - or is it actually a 64-bit ABI that is just called n32 by accident?

n32 is a 64-bit ABI with 32-bit pointers (something like the new x32 for x86).

>
>  I also noticed now that for lib64, we only create the symlinks if they
> exists in the external toolchain, and we remove the lib64 directory in the
> internal toolchain. Perhaps this can be simplified into creating the
> lib64/lib32 links unconditionally after installing the toolchain?

Whatever works best. I have no strong preference on this.

>
>
>
>> +       ln -sfn lib $(TARGET_DIR)/lib32; \
>> +               ln -sfn lib $(TARGET_DIR)/usr/lib32;
>
>
>  No need for the semicolon and the backslash, this can be done as two
> separate commands.

Ok I will fix that.

--
Regards,
Markos Chandras
