From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Feb 2014 10:30:32 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <530B1B21.6000200@imgtec.com>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate> <530B1B21.6000200@imgtec.com>
Message-ID: <530B1F48.5040603@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/2014 10:12 AM, Vicente Olivert Riera wrote:
> On 02/23/2014 10:00 AM, Thomas Petazzoni wrote:
>>>    mips64el |         ltp-testsuite-20130904 | NOK |
>>> http://autobuild.buildroot.net/results/f9b3780c712ba7e3cbb871dcfd5123340be688b3/
>>>
>>
>> Cannot work in master, it needs the version bump in next. Should we
>> disable ltp-testsuite build on mips64el in master?
>
> Disabling this package for the new release is the best solution. If we
> know that it will fail then it has no sense to keep it enabled.
>

Anyway..., this is not a problem of MIPS. This is a problem with this 
package and glibc >= 2.18. Here is the commit which fixed the problem 
upstream:

https://github.com/linux-test-project/ltp/commit/5811a1d7f007b2683c72d8315df0e0cd1c67a1b4


-- 
Vincent
