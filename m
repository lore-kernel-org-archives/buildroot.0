From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2019 23:07:59 +0200
Subject: [Buildroot] [PATCH 1/4] package: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <20190620214615.5c60748c@windsurf>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-2-victor.huesca@bootlin.com>
 <35a7118e-cdf1-b29e-bceb-6c02ecef187e@mind.be>
 <20190620083110.4986e5fa@windsurf>
 <348e13f5-efeb-7136-3315-ce437b12dad6@mind.be>
 <20190620214615.5c60748c@windsurf>
Message-ID: <6df042d5-7b20-3f4e-365f-9f7dd53c16a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/06/2019 21:46, Thomas Petazzoni wrote:
> On Thu, 20 Jun 2019 21:33:44 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 20/06/2019 08:31, Thomas Petazzoni wrote:
>>> On Wed, 19 Jun 2019 22:50:01 +0200
>>> Arnout Vandecappelle <arnout@mind.be> wrote:  
>> [snip]
>>>>  It would also be nice if we had some formal way of checking that new packages
>>>> do this correctly. Actually, it would be good if pkg-stats could generate a
>>>> report in a human-readable format so it could be used as part of the review flow
>>>> to check if the mapping with release-monitoring is OK (plus all the other things
>>>> pkg-stats evaluates).  
>>>
>>> Hm, yes, could be an interesting idea. Just a new pkg-stats option ?  
>>
>>  Actually, since pkg-stats is in support/scripts it's currently not supposed to
>> be user-visible. So I'd rather turn it around: make the text output to stdout
>> the default, and add an option to generate HTML.
> 
> While I agree, I don't understand the relationship with pkg-stats being
> in support/scripts. Are you saying that we should then add a "make
> <pkg>-check-upstream-version" target that would call pkg-stats with the
> right options ?

 Scripts in support/scripts are supposed to be Buildroot-internal scripts.
Scripts that are to be called by users should be in utils/.

 So, since it's in support/scripts, we're allowed to break compatibility.

 Regards,
 Arnout

> 
> I'm a bit confused here.
> 
> Thomas
> 
