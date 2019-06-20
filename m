From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2019 21:31:44 +0200
Subject: [Buildroot] [PATCH 1/4] package: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <4bae33eb-103b-3ff0-5090-a91d08a3089e@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-2-victor.huesca@bootlin.com>
 <35a7118e-cdf1-b29e-bceb-6c02ecef187e@mind.be>
 <4bae33eb-103b-3ff0-5090-a91d08a3089e@bootlin.com>
Message-ID: <a5bbcba5-ccaa-13d3-ecf1-bf1f33599891@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/06/2019 13:51, Victor Huesca wrote:
> 
> 
> On 19/06/2019 22:50, Arnout Vandecappelle wrote:
>>  Hi Victor,
>>
>>  The good news is, I applied to master :-)
> 
> Glad to here that :D
> 
>> On 12/06/2019 08:42, Victor Huesca wrote:
>>> On Github, a large number of projects name their tag vXYZ (i.e v3.0,
>>> v0.1, etc.). In some packages we do:
>>>
>>>  <pkg>_VERSION = v0.3
>>>  <pkg>_SITE = $(call github foo,bar,$(<pkg>_VERSION))
>>>
>>> And in some other packages we do:
>>>
>>>  <pkg>_VERSION = 0.3
>>>  <pkg>_SITE = $(call github foo,bar,v$(<pkg>_VERSION))
>>>
>>> I.e in one case we consider the version to be v0.3, in the other case
>>> we consider 0.3 to be the version.
>>>
>>> The problem with v0.3 is that when used in conjunction with
>>> release-monitoring.org, it doesn't work very well, because
>>> release-monitoring.org has the concept of "version prefix" and using
>>> that they drop the "v" prefix for the version.
>>
>>  Note: I double-checked: apparently, release-monitoring really *never* has a v
>> in front of the version. There are a few other things though, e.g. DIRECTFB_
> 
> As Thomas pointed out, packages that have a prefix in release-monitoring
> are most likely to be wrong -- their may be some exception but I did not
> see any up to now.

 If you scroll down the pkg-stats output [1] the ones with a prefix kind of
stand out. directfb [2] was the first one that I saw (but I only looked over it
very lightly).

> As a result we should modify their entry in release-monitoring rather
> than adjust the buildroot version to the latter.

 OK, agreed then.

[snip]
> I indeed used some scripts to automate the process of changing the
> version and test these changes. I'll try to include the useful one the
> next time I use one of them.

 Note that it's important to also make it clear what the manual changes are, or
(often) to split the parts which needed manual fixup in a separate patch.

[snip]
>>  This one doesn't exist anyore on github (I guess the tag has been removed), we
>> always download it from sources.buildroot.org. So here, I think the workaround
>> (except for bumping the version) is to set SOFTETHER_SOURCE to the old name, so
>> the download from sources.buildroot.org still works. Alternatively, we can ask
>> Peter to copy the tarball to the new name before this one is applied.
> 
> If we update the _SOURCE, a simple hardlink should be enough if space
> disk usage is a concern.

 For this one tarball, it's not going to make much of a difference :-)

 Regards,
 Arnout


[1] http://autobuild.buildroot.net/stats/
[2] https://release-monitoring.org/project/12626/
