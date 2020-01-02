From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 2 Jan 2020 18:19:34 +0100
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure due to
 HW PPC Crypto bug
In-Reply-To: <20200102100623.6ab6714b@windsurf>
References: <20200101163258.13c7de62@windsurf>
 <20200101165811.45110-1-giulio.benetti@benettiengineering.com>
 <20200102100623.6ab6714b@windsurf>
Message-ID: <14ce309b-f0ab-ec05-0eb3-1e880bd9fa13@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 1/2/20 10:06 AM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> Thanks for the patch. One comment below.
> 
> On Wed,  1 Jan 2020 17:58:11 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>   ifeq ($(BR2_aarch64_be),y)
>>   LIBNSS_ARCH = aarch64
>> +else ifeq ($(BR2_powerpc),y)
>> +LIBNSS_ARCH = ppc
>> +else ifeq ($(BR2_powerpc64),y)
>> +LIBNSS_ARCH = ppc64
>> +else ifeq ($(BR2_powerpc64le),y)
>> +LIBNSS_ARCH = ppc64le
>>   else
>>   LIBNSS_ARCH = $(ARCH)
>>   endif
> 
> Shouldn't we globally review the values that libnss wants for the
> OS_TEST variable (which we set to $(LIBNSS_ARCH)) and see if other
> architectures need similar tweaks ?

Absolutely yes, going to do that.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
