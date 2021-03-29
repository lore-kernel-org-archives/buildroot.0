From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Mar 2021 08:59:00 +0200
Subject: [Buildroot] [PATCH 0/5] legacy: drop old options (branch
 yem/drop-old-legacy)
In-Reply-To: <20210328195205.GQ24043@scaer>
References: <cover.1616878389.git.yann.morin.1998@free.fr>
 <20210328212402.696e0207@windsurf.home> <20210328195205.GQ24043@scaer>
Message-ID: <378607bf-548e-feec-a7b9-182bb6c50989@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/03/2021 21:52, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-03-28 21:24 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 27 Mar 2021 21:53:28 +0100
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>>> We advertise that legacy symbols will be removed after two years.
>>> However, so far, we've be more lax than that, and we only dropped
>>> symbols after about 5 year have elapsed.
>>>
>>> This series removes options in step, starting with the usual 5-year
>>> threshold, in 1-year increments, to eventually catch-up with the
>>> advertised 2-year threshold.
>> In fact, I am not sure I agree with the rule that we should keep them
>> only 2 years. Indeed, for users that follow the LTS releases, 2 years
>> should be more than enough. But believe it or not, our 12 months
>> maintenance period is still considered too short by users who don't
>> always have the resources/skills to update once a year. So we still do
>> have users that upgrade quite infrequently.

 Absolutely. I recently did an update from 2018.02 to 2021.02 for a user whom I
think is relatively conscientious about updating. So two years is definitely too
short.

 (As an aside: there's a good reason to not update too often, and that is that
some projects sometimes dramatically break compatibility. In my case, it's the
Phalcon PHP package - it took me three days to fix all the breakage in the
custom PHP scripts using that package, and I'm still not sure it's all good.)

>> Since the maintenance cost of those legacy options is essentially zero,
>> I am wondering if we really need to drop them. Should we change the
>> rule and drop the ones that are 5 years old for example ?

 Indeed. I always thought that the idea was that we would keep the legacy around
until there was some reason to remove them, but that we'd advertise some fixed
period to make sure people are not surprised about the removal.

 Regards,
 Arnout

> I noticed the two-year rule while adding the snippet, when I thought the
> rule was five years, when it was only customs.
> 
> So, I split the series in steps, so that we could at least abide by the
> established usage of dropping 5-year old entries, and then catch up to
> the rule.
> 
> I am OK with making the rule '5 years', since that's what I thought it
> was.
> 
> I'll resend an updated series.
> 
> Regards,
> Yann E. MORIN.
> 
