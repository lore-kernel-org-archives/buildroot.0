From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2019 09:19:40 +0200
Subject: [Buildroot] [PATCH v4 3/3] .gitlab-ci.yml: add trigger per job
In-Reply-To: <5cbd187c3c9b_707a3f9fd611a0e8645dd@ultri5.mail>
References: <7fdd9d95-c147-d5bf-ca56-c0fef507f737@mind.be>
 <5cbd187c3c9b_707a3f9fd611a0e8645dd@ultri5.mail>
Message-ID: <de070254-9408-b33b-83d6-25477c1f5703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/04/2019 03:27, Ricardo Martincoski wrote:
> Hello,
> 
> On Sat, Apr 13, 2019 at 10:46 AM, Arnout Vandecappelle wrote:
> 
>> On 08/04/2019 05:22, Ricardo Martincoski wrote:
>>> The check-* jobs are fast, so there is no need to add a per job trigger
>>> for them.
>>
>>  This bit is no longer true, right?

 I'm sorry, I had not read it correctly. I had read "The check-* jobs are fast,
so there is no need to exclude them from the defconfig and test branches."

 Indeed, there is no need to add a per job trigger. The main reason for that is
though that they'll run for every push anyway, so adding a separate trigger is
kind of useless.

> 
> I still think:
>  - The check-* jobs are fast
>  - there is no *need* to add a per job trigger for them.
> But with v4 of this series indeed it should be easy to add a per job trigger
> for them too, for consistence or some other reason.
> 
>>
>>  I can fix that up while applying, no need to resend.
> 
> So feel free to add them *if* you keep current behavior. For example, now when
> one pushes a branch to GitLab the 4 check-* jobs run.
> I guess you would need to do this for each of the 4 jobs:
> 
>  check-DEVELOPERS:
>      extends: .check_base
> +    only:
> +        - triggers
> +        - tags
> +        - branches
> +        - /-check-DEVELOPERS$/
> 
> If you intend to change the current behavior, please do this in a follow up
> patch so we can discuss a little more during its review.

 So no, that was not at all my intention.


>>  Also, I'll squash patches 2 and 3. Patch 2 is really not worth much on its own
>> IMO. It would make more sense to introduce the _base keys in a separate patch
>> (i.e. moving the artifacts to _base) and include the variable name in that
>> patch. But I don't think it's worth the effort to try to split like that.
> 
> OK. Please feel free to squash them.

 I'll do that when I get around to applying them :-)

 Regards,
 Arnout
