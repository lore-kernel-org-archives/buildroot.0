From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Wed, 15 Mar 2017 09:00:46 +0100
Subject: [Buildroot] [PATCH v3 3/3] Add defconfig for MIPS Creator ci40
In-Reply-To: <6fd775e5-93f9-5606-1701-5a3a0e48f14d@imgtec.com>
References: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <1488202681-9744-3-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <85ee8f03-2340-db12-593a-3914f3bac30e@mind.be>
 <6fd775e5-93f9-5606-1701-5a3a0e48f14d@imgtec.com>
Message-ID: <35a1983c-b746-e939-d694-6a63619a2760@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Abhi,

On 15.03.2017 08:06, Abhimanyu V wrote:
> On Tuesday 14 March 2017 02:27 PM, Arnout Vandecappelle wrote:
>>

>>
>>   Another option is to ask your kernel developers to use a FIT image
>> as the
>> uImage in linux arch/mips/boot/Makefile. For now, however, your
>> current solution
>> is OK for Buildroot.
> Yes this is something i also had in my mind, i will start the discussion
> with the team which manage this
> repo. Once we have this solution in place i will update it in follow up
> patch.


We've got fit image support available upstream now:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/mips/boot?id=cf2a5e0bb4c66e8c43caf9f1be93a1bd7fd07b17

This patch should be easy to backport, and the patch below will be 
useful as a reference on how to update your platform code:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/mips/?id=eed0eabd12ef061821cbfa20d903476e07645320

Marcin
