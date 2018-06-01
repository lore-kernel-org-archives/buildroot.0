From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 1 Jun 2018 13:12:56 +0200
Subject: [Buildroot] qt-4.8.7 ICE on powerpc [was:
 [autobuild.buildroot.net] Build results for 2018-05-31]
In-Reply-To: <20180601110638.5c41eacf@windsurf>
References: <20180601060027.2921620828@mail.bootlin.com>
 <a3c7791c-7502-5ce2-9677-355105fd23ec@mind.be>
 <20180601110638.5c41eacf@windsurf>
Message-ID: <bd26e178-b204-056d-3646-7ececd9964d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-06-18 11:06, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 1 Jun 2018 09:58:01 +0200, Arnout Vandecappelle wrote:
>> On 01-06-18 08:00, Thomas Petazzoni wrote:
>>>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cebd1d3d013d40bf71bf20696c28818f58d9533a | ORPH  
>>
>>  This one has also been failing for a *long* time. It is caused by
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818
> 
> Doesn't this bug report claims that the issue has been fixed in gcc
> 6.x... but still the autobuild failure happens with a gcc 6.x based
> toolchain ?

 Well, a single bug report sometimes contains multiple bugs :-). Apparently part
of the problem was only fixed in GCC7.2, and it's possible that some part is not
fixed yet.


 Regards,
 Arnout

> 
>>  Should we introduce a BR2_TOOLCHAIN_HAS_GCC_BUG_60818 here? However, AFAICS
>> it's only Qt4 that is failing, so maybe an autobuild exclusion is more
>> appropriate in this case.
> 
> I continue to prefer the BR2_TOOLCHAIN_HAS_GCC_BUG_xyz approach. There
> are only two packages that select BR2_PACKAGE_QT, and those packages in
> turn don't have any reverse dependencies. So it's not a big deal to
> propagate a BR2_TOOLCHAIN_HAS_GCC_BUG_xyz option.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
