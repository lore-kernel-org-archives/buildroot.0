From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Aug 2019 11:13:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <87v9ur54mx.fsf@dell.be.48ers.dk>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
 <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
 <20190819233256.01c0f4a1@windsurf.home>
 <87zhk4erxo.fsf@dell.be.48ers.dk>
 <77298569-2f0f-d650-d396-3ea4be5b09eb@mind.be>
 <b1f6a7dd-7451-ef46-de7c-51efb9a9c38b@mind.be>
 <20190821075136.GA12477@scaer> <87v9ur54mx.fsf@dell.be.48ers.dk>
Message-ID: <20190821091336.GD12477@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-08-21 10:01 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> Or perhaps it's a better idea to reverse the logic: on -rc1, create the stable
>  >> branch already, and treat master as next. IOW, avoid creating a next at all.
>  > I would argue in favour of this solution.
> We could do that as well. We then need to merge in the other direction
> (stable->master) to ensure fixes after rc1 (and updates to the CHANGES
> file) are not dropped,

Well, usual version control best practices suggests the opposite: all
fixes are done on master, and when relevant, back-ported to the stable
branch(es).

This is no different than what you do today when you backport changes
from master to the stable branches, except it happens right from -rc1
instead of after the final release. It is the exact same process.

> and website changes needs to happen on master
> rather than stable.

But that's already the case, no?

> It seems a bit more complicated to me, but that might just be because I
> have done the other way around for 10+ years by now ;)

Yeah, I know habbits, as bad as they might be, are hard to break! ;-p

>  >> But then we should probably also update the branches info for the autobuilders
>  >> to make sure the stable branch gets sufficient testing.
> 
>  > This is relatively easy: just update http://autobuild.buildroot.org/branches
>  > with new branches and new ratios.
> 
> Yes, but this file in manually maintained and only accessible by Thomas,
> right?

How would that be different from today? I would say that today, for each
release cycle, there are two changes:

  - one to introduce next in the list (after -rc1)
  - one to introduce the new stable rbanch and remove next and the
    oldest stable branch (after the release)

with the proposed change, there would be a single change per release:

  - one to add the new stable branch and remove the oldest stable branch
    (after -rc1)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
