From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 21 Aug 2018 20:45:16 -0300
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
References: <8f16afc7-b1c8-ad3a-038a-1a74d9722cee@mind.be>
Message-ID: <5b7ca40c638ef_2e653f8bdc09c14c19598@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Aug 21, 2018 at 05:22 PM, Arnout Vandecappelle wrote:

> On 16/08/2018 03:04, Ricardo Martincoski wrote:
>> 
>> On Mon, Aug 13, 2018 at 01:06 PM, Yann E. MORIN wrote:
>> 
>>> On 2018-08-13 11:13 -0300, ricardo.martincoski at gmail.com spake thusly:
>>>> On Sun, Aug 12, 2018 at 05:48 PM, Yann E. MORIN wrote:
> [snip]
>>>> So the best approach IMO is to ask "given we want a named ref, is that ref a
>>>> branch in the remote?". That obviously lead to using git ls-remote and check
>>>> the second column:
>>>
>>> I would prefer to avoid another round-trip to the remote, when we have
>>> the necessary information locally. What about the git-show-ref snippet I
>>> pasted above instead?
>> 
>> In the other hand with ls-remote we could fail faster, before downloading any
>> refs.
> 
>  A failure in this case is because the developer specified a branch name instead
> of a tag or sha. He in the end still wants to download that specific ref. So
> downloading it before the check does make sense, because that way the cache is
> already populated and the next attempt will go faster.

... because in this case we 'exit 1' instead of ditching the cache.

OK. Now I got why v2 should use show-ref. Thanks.


Regards,
Ricardo
