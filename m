From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 17 Apr 2013 15:27:23 +0800
Subject: [Buildroot] [PATCH v5 7/7] package: Introduce NOMMU symbol
In-Reply-To: <20130416233021.30c4486c@skate>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-7-git-send-email-sonic.adi@gmail.com>
 <20130416233021.30c4486c@skate>
Message-ID: <CAJxxZ0M=C+HiKcgEHtuzTS7Pmw_e6-j_MVTHyty81QvaFEtKGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 17, 2013 at 5:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 12 Apr 2013 18:18:29 +0800, Sonic Zhang wrote:
>
>>  ifeq ($(BR2_BINFMT_FLAT),y)
>>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
>> +
>> +ifneq ($(BR2_USE_MMU), y)
>
> There shouldn't be any space between the comma and the y.
>
>> +TARGET_CFLAGS += -D__NOMMU__
>>  endif
>>
>>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>
> And you're adding a ifneq condition without adding any endif. Smells
> like untested code :)
>
That's an error when I rebase this patch automatically. Should be fixed soon.

Regards,

Sonic
