From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 8 Feb 2019 20:27:27 +0100
Subject: [Buildroot] [TO-BE-TESTED] support/download/hg: implement
 repository cache
In-Reply-To: <20190208165403.GA3079@scaer>
References: <20190205202433.25292-1-patrickdepinguin@gmail.com>
 <5f0e55d2-99e2-bc68-4017-334dbafa35a9@mind.be> <20190208165403.GA3079@scaer>
Message-ID: <3e9d7a7a-9904-c2ab-0bb2-eb95a32895eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/02/2019 17:54, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2019-02-07 22:33 +0100, Arnout Vandecappelle spake thusly:
>> On 05/02/2019 21:24, Thomas De Schampheleire wrote:
>>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>>
>>> Similar to the git download helper, implement a repository cache for
>>> Mercurial repositories.
>>>
>>> The code is mostly guided by the implementation for git, with certain parts
>>> copied almost verbatim.
>>>
>>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>> ---
>>> index efb515fca5..bb5cc87969 100755
>>> --- a/support/download/hg
>>> +++ b/support/download/hg
>>> @@ -1,7 +1,7 @@
>>>  #!/usr/bin/env bash
>>>  
>>>  # We want to catch any unexpected failure, and exit immediately
>>> -set -e
>>> +set -E
>>
>>  If you do this, the comment above is no longer valid...
>>       -e  Exit immediately if a command exits with a non-zero status.
>>       -E  If set, the ERR trap is inherited by shell functions.
>> are not the same thing!
>>
>>  However, since AFAICS the only function in this file is the trap handler
>> itself, this seems to be a mistake, no?
>>
>>  Ow, this really is inherited from git, introduced by commit b7efb43e86da96.
>> Yann, care to explain?
> 
> Yes, I care to explain. Even though I do write some crap most of the
> time,

 I never said that!

> there are in fact two functions in the git backend.

 Oh yes, I missed the _git/_hg function.

> 
> Like all backends, the actual tool is wrapped into a _git() function,
> which was introduced more than three years ago, by commit 3f2bdd070
> (support/download: protect from custom commands with spaces in args), as
> a way to actually fix a bug actually reported by Thomas DS.
> 
> Yes, this makes it that the set -E is needed, after all.

 But then the comment is wrong, no? Because -E does not imply -e and without -e
there is no immediate exit. Or am I missing something else?


 Regards,
 Arnout

[snip]
