From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Apr 2017 23:48:10 +0200
Subject: [Buildroot] [PATCH v5 08/19] reproducible: try to detect most
 common errors
In-Reply-To: <20170401211306.GB3663@scaer>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-9-git-send-email-jezz@sysmic.org>
 <20170401165059.1f3f9ad5@free-electrons.com> <20170401211306.GB3663@scaer>
Message-ID: <735d5317-56f1-7367-3fe9-b0e87536eba5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-04-17 23:13, Yann E. MORIN wrote:
> Thomas, J?r?me, All,
> 
> On 2017-04-01 16:50 +0200, Thomas Petazzoni spake thusly:
>> On Tue, 20 Dec 2016 14:46:25 +0100, J?r?me Pouiller wrote:
>>> Some package includes some information from build environment in their results.
>>> This practice is incompatible with reproducible builds.
>>>
>>> This patch scans final target to research most common patterns.
>>>
>>> Since we only search fixed strings (grep is called with -F), this search is
>>> fast (on my station, 60ms for a target of 40MB).
>>>
>>> Note, it could be a good idea to also match current user name. However, build
>>> path often contains username and, until now, we do not try to avoid build path
>>> in result.
>>>
>>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>>
>> I am not entirely convinced it makes sense to grep more or less
>> randomly in all files specifically for those strings.
> 
> Indeed. My hostnames usually cary some computer-related keywords, which
> can very well occur in binary files (e.g. 'segfault').

 Even more so for uname -r, which could be something like 4.10...

> 
>> Or perhaps, we should have a separate shell scripts that checks for
>> several classes of obviously non-reproducible behaviors?
> 
> Indeed, but such a script can only be a helper that a user would
> voluntarily run on their own.
> 
> We can't have such a script automatically run, because those strings can
> be too common.

 Well, as proposed by Jerome, it would just print a warning at the end of the
build, which is probably acceptable.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
