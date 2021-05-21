From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 21 May 2021 16:21:59 +0200
Subject: [Buildroot] [PATCH 0/9] Fix binutils bug 21464 and remove it
In-Reply-To: <8db63dbe-1abb-3fbf-59c6-6cb14fde577c@mind.be>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
 <8db63dbe-1abb-3fbf-59c6-6cb14fde577c@mind.be>
Message-ID: <62032574-bad4-5d93-fc72-4d3b455fe899@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 5/21/21 10:46 AM, Arnout Vandecappelle wrote:
>   Hi Giulio,
> 
>   Thanks for these!

Happy to help :-)

> On 03/05/2021 13:13, Giulio Benetti wrote:
>> This patchset fixes binutils bug 21464 and fixes libgeos build failure
>> by introducing the gcc option flag -mcmodel. This is done by adding
>> upstreamed binutils and gcc patches. Note tha this way buildroot
>> toolchains can be considered bug binutils 21464 free and the only other
>> OpenRisc toolchain supported is the external Bootlin one. So this
>> patchset has to be considered valid once Bootlin updates its OpenRisc
>> by adding binutils and gcc patches that are added with patches in this
>> patchset.
>>
>> Giulio Benetti (9):
>>    package/binutils: update or1k patches for plt link version with
>>      upstream
>>    package/binutils: add upstream backported patches to support
>>      -mcmodel=large gcc option
>>    package/gcc: add upstream patches that introduce -mcmodel=large option
>>      for or1k
> 
>   Patches 1-3 applied to master. Note that I had to fix all of them up because
> they failed check-package. The [PATCH N/M] things are not allowed. Ideally, when
> you add patches, you shouldn't just pluck them from the mailing list. Instead,
> you should apply them in a git clone - preferably by cherry-picking with `git
> cherry-pick -x <sha1>` if they have been applied upstream. Then you should
> regenerate *all* patches `git format-patch -N <base>..`. Then verify that only
> the patches that you intended to change have actually changed.

Oh right, thank you for modifying them, I've forgotten to check-package 
them.

> 
>>    package/libgeos: fix build failure due to missing -mcmodel=large
>>    package/protobuf: fix build failure due to missing -mcmodel=large
> 
>   As mentioned, these can only be applied after Thomas updates the bootlin
> toolchains *and* the patch to update them in Buildroot has been merged. That's
> not going to happen on master :-)

Ok

>>    toolchain: remove binutils bug 21464
>>    package/libgeos: remove binutils bug 21464 dependency
>>    package/postgis: remove libgeos binutils bug 21464 inheritance
>>    package/protobuf: remove binutils bug 21464 dependency
> 
>   These four should be squashed into a single patch.

I've just sent a v2 for this:
https://patchwork.ozlabs.org/project/buildroot/patch/20210521140942.3032331-1-giulio.benetti at benettiengineering.com/


Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
