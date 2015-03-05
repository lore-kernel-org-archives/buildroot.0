From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 5 Mar 2015 13:23:39 +0100
Subject: [Buildroot] [PATCH] package/mono-gtksharp: new package
In-Reply-To: <54F84844.2070004@mind.be>
References: <1423908982-23475-1-git-send-email-angelo.compagnucci@gmail.com>
 <54F79F86.90108@mind.be>
 <CA+TH9VmkD+8yfdhxcf1yPoStPuK8bGkWj6T-GRJpxDPc+Ku0-w@mail.gmail.com>
 <54F84844.2070004@mind.be>
Message-ID: <CA+TH9Vm+fqTKyhiECQPiXSqo95OQ-b_j+XV7fmBS_ir-Q6QjsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2015-03-05 13:12 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
> On 05/03/15 12:44, Angelo Compagnucci wrote:
>> Dear Arnout Vandecappelle,
>>
>> 2015-03-05 1:12 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>> On 14/02/15 11:16, Angelo Compagnucci wrote:
> [snip]
>>>> +MONO_GTKSHARP_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP_VERSION_MAJOR)/
>>>> +MONO_GTKSHARP_SOURCE = gtk-sharp-$(MONO_GTKSHARP_VERSION).tar.xz
>>>> +MONO_GTKSHARP_LICENSE = LGPLv2
>>>
>>>  A few files, in particular all of the cairo library, is MIT rather than LGPLv2.
>>> The others are combined with LGPLv2 code in a single DLL so LGPLv2 is correct,
>>> but the cairo library is a separate DLL that doesn't seem to depend on any other
>>> gtksharp library, so I'd make that
>>>
>>> MONO_GTKSHARP_LICENSE = LGPLv2, MIT (cairo)
>>
>> I don't think there are cairo files distributed with mono, the cairo
>> folder contains a c# wrapper to cairo, but it's original code. Can you
>> point me to the offending files?
>
>  I am indeed referring to the C# wrapper of cairo. Gtk# builds a .so and .dll
> for cairo, which AFAICS can be used independently from the rest of Gtk#, and
> which AFAICS is only derived from sources that carry a MIT license (i.e.,
> everything in the cairo/ directory).
>
>  (cairo itself is still LGPLv2+, of course. However, since this is a different
> shared library, the cairo# .dll and .so could be used with a
> differently-licensed implementation of the cairo ABI).

Ops, you are totally right! I haven't noticed that the cairo wrapper
was under another license!

For the other question about select/depends, Thomas in a previous
thread said me to use depends instead of select!

Sincerely, Angelo

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
