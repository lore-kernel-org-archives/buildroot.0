From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Oct 2015 14:29:07 +0100
Subject: [Buildroot] [PATCH v14 1/1] squeezelite: new package
In-Reply-To: <201510011139.t91BdD7E003057@ms-omx01.plus.so-net.ne.jp>
References: <201510011139.t91BdD7E003057@ms-omx01.plus.so-net.ne.jp>
Message-ID: <560D3523.1040509@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On 10/01/2015 12:39 PM, kei-k at ca2.so-net.ne.jp wrote:
> Dear, Vincent, all.
> 
> I deeply appreciate if you suggest me which is preferred (or policy ?)
> of buildroot community.

I don't know the policy in this case, and I don't even know if we have
one. What I was suggesting is my personal opinion. I really think is
better to have a flexible and cross-compile friendly Makefile upstream
(since you are in control of the upstream repository) rather than fixing
it only in Buildroot. If you fix it upstream, other projects could
benefit from that, not only Buildroot. But, again, this is only my
personal opinion. Better to listen the opinion of other developers as
well, specially the maintainers Thomas and Peter.

Regards,

Vincent.

> Regards,
> Kawashima
> 
> kei-k at ca2.so-net.ne.jp writes:
>> Dear, Vincent.
>>
>> Thank you for your comment.
>>
>>> ...fix the Makefile upstream (your github repo) instead of adding a
>>> patch in Buildroot?
>>
>> Since this modification is buildroot specific, modification should be
>> embeded in buildroot environment (as patch file), I should untouch
>> original source trees as possible as I can, that is my understanding.
>>
>> But anyway, I will obey your (buildroot community) preference.
>>
>> I will have 2 choice.
>> 1) Use current method (patching to original Makefile).
>> 2) Prepare modified Makefile.buildroot and add to my github repo.
>>
>> Which is preferred ?
>> Please advise me.
>>
>> Regards,
>> Kawashima
>>
>> Vicente Olivert Riera writes:
>>> Dear Hiroshi Kawashima,
>>>
>>> On 09/30/2015 03:34 PM, kei-k at ca2.so-net.ne.jp wrote:
>>>> Dear all.
>>>>
>>>> I will appreciate if you point out anything I should improve for
>>>> following patch.
>>>>
>>>> Thanks,
>>>> Kawashima
>>>>
>>>>> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
>>>>> ---
>>>>> Changelog
>>>>> v13 -> v14
>>>>> - change to use patch file insted of using sed to generate Makefile.
>>>
>>> [snip]
>>>
>>>>> v12 -> v13
>>>>> - change SQUEEZELITE_SITE to github (mine), cloned from original
>>>>>   google code site (original site is unstable to fetch).
>>>
>>> So you own a clone of that project on github, and the package you want
>>> to add in Buildroot clones from it. Great! Then, why not...
>>>
>>> [snip]
>>>
>>>>> - to accomplish above, change to generate buildroot suitable Makefile fr
>> om
>>>>>   original squeezelite's Makefile (using 'override' directive for CFLAGS
>> ,
>>>>>   LDFLAGS).
>>>
>>> ...fix the Makefile upstream (your github repo) instead of adding a
>>> patch in Buildroot?
>>>
>>> Regards,
>>>
>>> Vincent.
>>>
>>> [snip]
>> ============================================================
>>     Hiroshi Kawashima
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> ============================================================
>     Hiroshi Kawashima
> 
