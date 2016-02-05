From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 5 Feb 2016 10:25:38 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
	licensing
In-Reply-To: <20160204204224.GA3468@free.fr>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
 <20160203230208.GB3428@free.fr> <56B293F2.9070201@mind.be>
 <20160204204224.GA3468@free.fr>
Message-ID: <56B46A92.3040204@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Yann E. MORIN wrote:
> Arnout, Luca, All,
>
> On 2016-02-04 00:57 +0100, Arnout Vandecappelle spake thusly:
>> On 04-02-16 00:02, Yann E. MORIN wrote:
>>> On 2016-02-01 23:19 +0100, Luca Ceresoli spake thusly:
>>>> Several people have been asking what is the license of the patches
>>>> provided by Buildroot. COPYING is the authoritative place to state it.
>>>>
>>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>>
>>>> ---
>>>> Changes v1 -> v2:
>>>>   - Rewrite it almost entirely (Arnout, Thomas).
>>>> ---
>>>>   COPYING | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/COPYING b/COPYING
>>>> index d511905..3596777 100644
>>>> --- a/COPYING
>>>> +++ b/COPYING
>>>> @@ -1,3 +1,11 @@
>>>> +Except for the patches provided for packages, Buildroot is licensed
>>>> +under the GNU General Public License, version 2.
> [--SNIP--]
>>>> +Patches provided by Buildroot for packages are released under the same
>>>> +license as the software that they modify.
>>>
>>> Here's an alternative proposal, to replace both sentences:
>>>
>>>      Buildroot comes with its own license, reproduced below.
>>>
>>>      Buildroot also bundles patch files, which are applied to the
>>>      sources of the various packages. Those patches are not covered
>>>      by the license of Buildroot. See those individual packages for
>>>      their license (running 'make legal-info' after your build may
>>>      help).
>>
>>   Much better.
>>
>>   Still better:
>>
>>      Buildroot comes with its own license, reproduced below.
>>
>>      Buildroot also bundles patch files, which are applied to the
>>      sources of the various packages. Those patches are not covered
>>      by the license of Buildroot, but are provided under the same
>>      license as the software they apply to. Run 'make legal-info' to
>>      collect the licenses of your selected packages and their patches.

I would like to preserve from the original wording by Yann the fact that
'make legal-info' _may_ _help_ to collect the needed info. It's safer in
the case legal-info provides incomplete or incorrect information, e.g.
when FOO_LICENSE is incorrect (it has happened in the past, it will in
the future).

>> (borrowing from the update of the manual here).
>>
>>   Note that this sentence doesn't clarify the issue of proprietary licenses. It's
>> basically still the same as what we have now in that respect.
>
> Not really. It is implicitly addressed, since the above states:
>
>      [The patches] are provided under the same license as the software
>      they apply to.
>
> So, if someone has a proprietary license for a package *we* only can get
> under an Open Source license, that someone would potentially be tricked
> into believing that the patches we carry are under the license he was
> provided that package under. Which is not really true, see below...
>
> There are only two options:
>
>
>   1) Our patches are available under the same license as the package they
>      apply to is publicly and commonly available under.
>
>      This basically means the patches can't be applied to a proprietary-
>      licensed package when it is only publicly and commonly available
>      under a Free (aka GPL-like) license. However, for an Open Source
>      (aka BSD-like) license, they might still be useable on a proprietary-
>      licensed package; and even so, that might not be completely possible,
>      see point 2, third paragraph, below.
>
>      This position has the benefit of clarifying the status of existing
>      patches, as we can't easily relicense them, while we can easily
>      srand by the position that this was the intended situation to begin
>      with.
>
>
>   2) Our patches are available under a license that allows them to still
>      be applied even if the recipient of the package they modify has been
>      granted different licensing terms (aka proprietary) than the ones
>      that package is publicly and commonly available under.
>
>      This means that part of the software we write is no longer Free (as
>      from a GPL-sided point-of-view), basically this is a blank check for
>      including them in proprietary software.
>
>      Furthermore, we can not know all the proprietary licenses each such
>      package may be available under, by the mere fact that such licenses
>      may not be publicly known. In most, if not all jurisdiction, one can
>      not be bound by terms one does not have knowledge of. I.e. if we
>      wanted our patches to be useable under those licenses, then we would
>      have to provide our patches under a *very* liberal license, probably
>      just the Public Domain, as any license, even the most liberal ones
>      like the WTFPL, may have terms that contradicts terms of such a
>      proprietary license (which we have no detail for).
>
>      Finally, this can not apply to our existing patches, as we can not
>      assume that the original submitters of those patches would have
>      expected they be made available under any license beside the license
>      under which the package is publicly and commonly available.  I.e.
>      we're anyway screwed with existing patches.

At first I thought we had a choice between 1) and 2). But after
reconsidering it, option 2) is most likely just illegal, and definitely
risky.

My vote is for option 1) too.

We had several rewrite proposals so far. I'll wait a few more days for
more comments, then resubmit. Peter, your opinion would be most welcome.
-- 
Luca
