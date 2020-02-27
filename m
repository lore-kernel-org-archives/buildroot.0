From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Feb 2020 12:20:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: fix build failure due to
 gcc bug 93847
In-Reply-To: <20200227091725.05b1b0df@windsurf>
References: <20200220154004.126384-1-giulio.benetti@benettiengineering.com>
 <20200220154004.126384-2-giulio.benetti@benettiengineering.com>
 <871rqh56r3.fsf@dell.be.48ers.dk> <20200227091725.05b1b0df@windsurf>
Message-ID: <63625531-517d-5687-6383-f775b03ad2d1@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On 2/27/20 9:17 AM, Thomas Petazzoni wrote:
> Hello Peter,
> 
> On Wed, 26 Feb 2020 23:22:08 +0100
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>   > -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>>   > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
>>
>> This fails for a (hypothetical) toolchain affected by both issues,
>> perhaps something like this would be better?
>>
>> ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)
> 
> True in the general case. But BR2_TOOLCHAIN_HAS_GCC_BUG_85180 only
> applies to Microblaze, and BR2_TOOLCHAIN_HAS_GCC_BUG_93847 to NIOS2. So
> practically speaking, they are mutually exclusive options, so the case
> where both are enabled at the same time is impossible.
> 
> But I agree that in the general case what you showed would be
> preferable.

I've just sent a patch for this:
https://patchwork.ozlabs.org/patch/1245735/

even if not harmful, it's wrong.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
