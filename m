From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 28 Oct 2014 16:02:03 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
In-Reply-To: <20141017213938.GK3971@free.fr>
References: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>
 <543A9384.8050803@lucaceresoli.net> <543B52A0.6060007@gmail.com>
 <543BC031.60606@lucaceresoli.net> <543D33DF.8070005@mind.be>
 <CADCpmyO_-VD52UDJf5MpZGDnTtzJwxyXcOONYwG-rsd4K_7DLQ@mail.gmail.com>
 <543D901B.8010806@mind.be> <20141017210715.GF3971@free.fr>
 <544189EC.5050905@gmail.com> <20141017213938.GK3971@free.fr>
Message-ID: <544FAFEB.2030309@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary,

Yann E. MORIN wrote:
> Gary, All,
>
> On 2014-10-17 14:28 -0700, Gary Bisson spake thusly:
>> On 10/17/2014 02:07 PM, Yann E. MORIN wrote:
>>> [snip]
>>> No you can't do that, because BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>>> is part of a choice, and you can not select a choice entry.
>>>
>>> So a 'depends on' it must be in this case.
>>>
>>> Not sure what to do about the comment, though. We currently have no such
>>> case documented in the manual; only comments about toolchain deps are
>>> described...
>>>
>>> I'm not against adding comments about dependencies on other packages,
>>> but I think we should keep them to a minimal level, like dependencies on
>>> biggish stuff (like X.org), or non-obvious stuff.
>>>
>>> Regards,
>>> Yann E. MORIN.
>>
>> I agree that a dependency seemed like the only option. Regarding the comment
>> it was more about showing the package exists.
>> Although doing a search will tell you about it and its dependencies I'm
>> afraid people would think the package is missing.
>> As a comparison the Gstreamer 0.10 fsl plugin always shows up as it does not
>> depend on iMX6 GPU libs.
>>
>> Anyway, would it make sense for me to offer a patch v2 or should we wait to
>> agree first on modifications?
>
> Yup, let people get back home from D?sseldorf and get some rest aftert
> the heavy use they put their neurons at during LinuxCon/ELCE this past
> week... ;-)
>
>> So far I have listed those modifications to be made on the current version:
>> - Use of github helper macro
>> - Modify package comment with Peter S. original patch
>> - Remove eglibc dependency (already from GPU libs)
>
> Are we sure gst1-plugins-imx does not itself require glibc?
> If there are pre-built libraries, check they are not linked with
> libc.so.6:
>      readelf -d libgst-imx-something.so
>
>> But I am still unclear on two items:
>> - Package naming: although Peter K. did prefer gstreamer1-imx over
>> gstreamer-imx [1], gst1-plugins-imx still looks closer to BR plugin naming.
>> Also consider the Yocto recipe name [2] which is gstreamer1.0-plugins-imx,
>> pretty close from gst1-plugins-imx.
>
> Well, gst1-plugins-imx seems quite correctly aligned to existing
> packages names, so I'd vote for that.
>
>> - Comments: comments on package dependencies could be removed at first and
>> if people find it confusing we could work on it later.

I agree with Yann. You addressed the most relevant issues, so now you
may send a v3 with all agreed changes. It might be not yet perfect, but
I (and hopefully Yann and others) will review it and I'm pretty sure
it's going to be very close to be accepted.

-- 
Luca
