From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 22 Apr 2015 08:01:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <5536B0BA.2070100@mind.be>
References: <1429623019-12174-1-git-send-email-lionel.orry@gmail.com>
 <20150421153349.715c50f7@free-electrons.com>
 <CAKAx1cg4csBWbVi5wKKKPcTBkocTQuf08G2YEMeZHTT686e+8g@mail.gmail.com>
 <5536B0BA.2070100@mind.be>
Message-ID: <CAKAx1chfSwdhSnyWud4fqMj5hh6pjAZLLcTQL2HppRoHs529tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Apr 21, 2015 at 10:19 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21/04/15 15:39, Lionel Orry wrote:
>> Hello,
>>
>> On Tue, Apr 21, 2015 at 3:33 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Lionel Orry,
>>>
>>> On Tue, 21 Apr 2015 15:30:19 +0200, Lionel Orry wrote:
>>>> The current configuration system does not check for cached variables for
>>>> these flags, and thus they are always disabled when cross-compiling.
>>>> This patch fixes the configuration system to use cached variables and
>>>> enables them at configuration time.
>>>>
>>>> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
>>>> ---
>>>>  ...e.m4-make-kernel-specific-flags-cacheable.patch | 204 +++++++++++++++++++++
>>>>  package/zeromq/zeromq.mk                           |  10 +
>>>>  2 files changed, 214 insertions(+)
>>>>  create mode 100644 package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
>>>>
>>>> diff --git a/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch b/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
>>>> new file mode 100644
>>>> index 0000000..9b6e808
>>>> --- /dev/null
>>>> +++ b/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
>>>> @@ -0,0 +1,204 @@
>>>> +From 2eee4dd2b1668124f377f6da1d511249086a1449 Mon Sep 17 00:00:00 2001
>>>> +From: Lionel Orry <lionel.orry@gmail.com>
>>>> +Date: Fri, 6 Feb 2015 09:45:21 +0100
>>>> +Subject: [PATCH 1/1] acinclude.m4: make kernel-specific flags cacheable
>>>> +
>>>> +Specifically when cross-compiling, one can be willing to force these
>>>> +variable values using the environment of a config.cache file. This
>>>> +commit makes this possible.
>>>> +
>>>> +The affected variables are:
>>>> +
>>>> +* libzmq_cv_sock_cloexec
>>>> +* libzmq_cv_so_keepalive
>>>> +* libzmq_cv_tcp_keepcnt
>>>> +* libzmq_cv_tcp_keepidle
>>>> +* libzmq_cv_tcp_keepintvl
>>>> +* libzmq_cv_tcp_keepalive
>>>> +
>>>> +Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
>>>
>>> Could you state whether this patch is upstream or not?
>>
>> This patch is upstream in v4.1.x branch, so it will be included
>> upstream as soon as zeromq v4.1.0 is released.
>
>  If the patch is already upstream, and the upstream patch applies cleanly,
> please use the upstream patch instead (adding you Sob if necessary and adding a
> reference to the upstream commit sha). If the upstream patch does not apply
> cleanly you can keep using this custom patch, but please still add a reference
> to the upstream sha.

It applies successfully, with a 20 lines offset. Should I use the
upstream patch in these conditions ?

Another question, how do I make a proper buildroot patch file from a
cmmit ? Is there a recommended way ?

I did, on libzmq repository:

git show 9daf6 > 0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch

And tested this patch. Is this correct ?

>
>
>  Regards,
>  Arnout
>
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
