From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 13:38:10 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180206105019.tqnsw3i5l44mt5vs@tarshish>
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
 <cfa2c67c-d3c8-81cd-7f50-60de1834d1ed@mind.be>
 <20180206105019.tqnsw3i5l44mt5vs@tarshish>
Message-ID: <11a3e447-082e-7c81-9bf9-e3a8d0c3af3f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 11:50, Baruch Siach wrote:
> Hi Arnout,
> 
> On Tue, Feb 06, 2018 at 09:18:38AM +0100, Arnout Vandecappelle wrote:
>> On 05-02-18 22:01, Baruch Siach wrote:
>>> On Mon, Feb 05, 2018 at 09:57:16PM +0100, Romain Naour wrote:
>>>> See: https://sourceware.org/ml/libc-announce/2018/msg00000.html
>>>> https://sourceware.org/glibc/wiki/Release/2.27
>>> Note that this is a security bump fixing CVE-2017-1000408, CVE-2017-1000409, 
>>> CVE-2017-16997, CVE-2018-1000001, and CVE-2018-6485.
>>
>>  Even though this release fixes a number of CVEs, I wouldn't call it a security
>> bump. Indeed, it also makes a number of potentially breaking feature updates,
>> cfr. the memfd_create() change.
>>
>>  So, I would indeed mention the CVE numbers in the commit message, but not put
>> "security bump" in the title so that it doesn't mindlessly get applied to LTS
>> branches.
>>
>>  Now, in this particular case we made enough noise about it that it really
>> doesn't matter what goes into the subject line :-) However I think it's good to
>> converge on some conventions on how to tag LTS things.
> 
> I agree that this bump might not be suitable for the maintenance branches. But 
> I think we should consider it for the master branch, especially since we are 
> still early in the -rc cycle.

 After a bit of discussion at the BR developer meeting: if it fixes CVEs, it
should be called a "security bump". So ignore my earlier comment. It something
that should be backported to LTS.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
