From: Cody P Schafer <dev@codyps.com>
Date: Sun, 11 May 2014 13:44:50 -0700
Subject: [Buildroot] [PATCH 1/2] powerpc64 powerpc64le: add support
In-Reply-To: <536F65CD.4070901@zacarias.com.ar>
References: <1399796286-14822-1-git-send-email-cody@linux.vnet.ibm.com>
 <536F65CD.4070901@zacarias.com.ar>
Message-ID: <CAPoQQ-2Xq7MSaH4AH4mRpzj0dQayaHGiOcK10KBSwqoiFKkzqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You're right, that ALTIVEC selection needs to be removed.

On Sun, May 11, 2014 at 4:58 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 05/11/2014 05:18 AM, Cody P Schafer wrote:
>
>>  config BR2_generic_powerpc
>>       bool "generic"
>> +     select BR2_POWERPC_CPU_HAS_ALTIVEC if BR2_ARCH_IS_64
>
>> +config BR2_powerpc_power4
>> +     bool "power4"
>> +config BR2_powerpc_power5
>> +     bool "power5"
>
> Generic has altivec and power4/5 don't?
> That doesn't sound right, generic should be the lowest common denominator...
> Regards.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
