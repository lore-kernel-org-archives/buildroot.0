From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Oct 2013 13:11:12 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] manual: add section about
 depending on target and toolchain options
In-Reply-To: <CAAXf6LXLV59szv9d-7FJJdGE=cOvvDowTTZGpWep5vyFFxJ2jQ@mail.gmail.com>
References: <patchbomb.1380099393@argentina>
 <679aaf4f4d6cb323f13d.1380099395@argentina> <524D00D9.9070800@mind.be>
 <CAAXf6LXLV59szv9d-7FJJdGE=cOvvDowTTZGpWep5vyFFxJ2jQ@mail.gmail.com>
Message-ID: <524D50D0.8060906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/13 09:34, Thomas De Schampheleire wrote:
> Hi Arnout,
>
> On Thu, Oct 3, 2013 at 7:30 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 09/25/13 10:56, Thomas De Schampheleire wrote:
> [..]
>>> Notes:
>>> - How we will specify the C library is currently marked as 'to be
>>> decided'.
>>> This patch series does not yet unify that, but I plan to do that in a new
>>> patch (or update this series if we can reach a decision shortly).  The
>>> problem
>>> is that not all packages that have a dependency on e.g. glibc add a
>>> comment to
>>> show this to the user. A proposal would be to have a comment like:
>>>       foo needs a (e)glibc toolchain w/ featA, featB, featC
>>> where the '(e)glibc' string would be left out if there is no constraint on
>>> the
>>> C library.
>>
>>
>>   Looks good to me. Though for glibc there is only one feature AFAIK: C++.
>>
>>
>
> I'm not sure what you mean here. I think that some packages depend on
> an (e)glibc toolchain because it requires certain features that are
> lacking in uclibc. I haven't checked for the details though. It may be
> the presence of certain system calls.

  (e)glibc always has all features enabled, except for C++ (and RPC in 
some cases but I don't think we have those).

  Which is fortunate, because it means the additional (e)glibc part isn't 
likely to make the line too long.

[snip]
>>> +** Comment string: +dynamic library+
>>
>>
>>   For the sake of brevity, maybe "DLL"?
>
> DLL really has a Windows annotation for me. Moreover, it's not so
> commonly used in the Linux world, don't you think?

  True. I'm just thinking that this is a pretty long string, that in 
addition is likely to be combined with a lot of other things.

  The dynamic library support is anyway a bit of a problem, because it 
bears little relation to the config option "prefer static libraries". 
That part, however, will hopefully be fixed when the other Thomas adds 
the choice between static-only, dynamic-only and both.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
