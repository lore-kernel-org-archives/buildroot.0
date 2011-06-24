From: Bryan Hundven <bryanhundven@gmail.com>
Date: Fri, 24 Jun 2011 15:07:15 -0700
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
In-Reply-To: <BANLkTikpPkkM91XVkuQtR5pRYftmz6Qyjw@mail.gmail.com>
References: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
 <4E04C9EE.4050206@rossvideo.com>
 <BANLkTi=m8QyX9YMrp_eeMUT=SMiU6D6Jbw@mail.gmail.com>
 <BANLkTikSaJuy6OcfSzX-Hg9iPt-fcuFPHw@mail.gmail.com>
 <BANLkTi=WO-27QC5=0_qf6jvq_oO5fdY7eA@mail.gmail.com>
 <BANLkTikpPkkM91XVkuQtR5pRYftmz6Qyjw@mail.gmail.com>
Message-ID: <BANLkTinAuqtwz0Mn0-SBRWVRgMyZaMwS2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 24, 2011 at 3:04 PM, raymond zhao <raymond.zhao.ml@gmail.com> wrote:
> buildroot: gcc 4.6.x,
> in .config:
> CT_CC="gcc"
> CT_CC_VERSION="4.6.0"
> CT_CC_gcc=y
> CT_CC_GCC_SHOW_LINARO=y
> # CT_CC_V_linaro_4_6_2011_04_0 is not set
>
> My development machine is ubuntu 10.04, with gcc 4.4.3
>
> thanks
> raymond

It would be helpful if you could post your config and build log
somewhere, but please don't email it to the mailing list.

Also, could you avoid top posting in your emails?

> On Fri, Jun 24, 2011 at 5:44 PM, Bryan Hundven <bryanhundven@gmail.com> wrote:
>> On Fri, Jun 24, 2011 at 2:41 PM, raymond zhao <raymond.zhao.ml@gmail.com> wrote:
>>> The error caused by the option "-mabi=spe"
>>> The cross compiler report: cc1: error: not configured for ABI: 'spe'.
>>> So, there must be some option need to be past when we compile the GCC.
>>> Anyone has any idea?
>>
>> What version of gcc are you using?
>>
>>> thanks,
>>>
>>> Raymond
>>>
>>> On Fri, Jun 24, 2011 at 5:14 PM, raymond zhao <raymond.zhao.ml@gmail.com> wrote:
>>>>
>>>> Thanks, Matias
>>>> After looked into the scripts. I believe you are right. But somehow I have
>>>> problem with building target gdb server when I put this flags there. I am
>>>> keep digging now.
>>>>
>>>> thanks
>>>>
>>>> raymond
>>>> On Fri, Jun 24, 2011 at 1:31 PM, Matias Garcia <mgarcia@rossvideo.com>
>>>> wrote:
>>>>>
>>>>> Hi Raymond,
>>>>>
>>>>> You can put those in the BR2_TARGET_OPTIMIZATIONS setting under the
>>>>> Toolchain page e.g.
>>>>>
>>>>> (-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double) ?Target
>>>>> Optimizations
>>>>>
>>>>> I selected a generic powerpc target because I didn't need the -mtune when
>>>>> I was specifying -mcpu already. As far as I know, 8548 and 8540 work out to
>>>>> the same code.
>>>>>
>>>>> I switched to the external CodeSourcery build tools for two reasons: (1)
>>>>> it allowed us to compile our application with -O3 (which we need) while the
>>>>> standard GNU toolchain caused some errors, and (2) they're supported by the
>>>>> Freescale/Mentor/CodeSourcery relationship, and not all of the patches get
>>>>> applied to mainline (particularly for newer processors). I had to add an
>>>>> option to the external wrapper so that it would call the toolchain with
>>>>> '-te500v2' which is a shortcut for the optimizations you list below. In that
>>>>> case, you can build your own applications without calling any options
>>>>> explicitly.
>>>>>
>>>>> Cheers,
>>>>> Matias
>>>>>
>>>>> On 11-06-24 10:27 AM, raymond zhao wrote:
>>>>>>
>>>>>> Hi,
>>>>>> I am using freescale's p1020 CPU. It is a e500v2 core. How could I
>>>>>> config the build root to tune the tool chain for the following
>>>>>> options:
>>>>>>
>>>>>> -mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double
>>>>>>
>>>>>> ?From the menuconfig, I can only select CPU as 8540.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Raymond
>>>>>> _______________________________________________
>>>>>> buildroot mailing list
>>>>>> buildroot at busybox.net
>>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
>

Thanks,

-Bryan
