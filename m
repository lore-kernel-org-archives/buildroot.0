From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Apr 2018 23:17:28 -0300
Subject: [Buildroot] [RFC PATCH 1/3] download/git: fix fetch all refs
 for old git
References: <20180415121222.GC21958@scaer>
Message-ID: <5ad407b8c9c0b_5cd72ac50edb1bd898726@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> On 2018-04-13 15:23 -0300, Ricardo Martincoski spake thusly:
>> On Thu, Apr 12, 2018 at 02:42 PM, Yann E. MORIN wrote:
>> >> -    _git fetch origin -t
>> >> +    _git fetch origin -u "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"
>> > Why don't we just run:
>> >     git fetch origin
>> >     git fetch origin -t
>> 
>> One extra connection to the server ...
>> but much more readable/maintainable!
>> I will do. I will change this patch to Changes Requested.
> 
> Thanks. I don't care much about an extra round-trip to the server,
> especially if that makes the code easier to read.

I agree.
And a few years from now, when we stop supporting distros with git <1.9.0 we
can remove 'git fetch origin' if we wish.

BTW, the order of the commands is important here. Some dumb http servers don't
work well with old git versions if 'git fetch origin -t' is used first, see:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/62895510
But in the order you propose (and I see you used in your series) it works fine:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/62897927
So we are good.

> OK, but overall, we would cover all cases with the two git-fetch,
> whether we use an old git or a newer one, and that's the important
> info.

Agreed.


Regards,
Ricardo
