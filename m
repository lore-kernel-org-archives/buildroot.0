From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 22:52:17 +0200
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add hash for the license
 file
In-Reply-To: <20190529101410.445880c4@thl530.multi.box>
References: <20190527153054.12381-1-b.bilas@grinn-global.com>
 <20190528084115.77e880c5@thl530.multi.box>
 <86ace6ef-9f4c-8729-519a-cfc65abfa47d@grinn-global.com>
 <fbd70fed-f646-a268-6f16-d8ba9caea2da@mind.be>
 <20190529101410.445880c4@thl530.multi.box>
Message-ID: <c05e5ba7-667a-ad2a-982c-e71394388793@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 10:14, Thomas Huth wrote:
> Am Tue, 28 May 2019 20:16:42 +0200
> schrieb Arnout Vandecappelle <arnout@mind.be>:
> 
>>
>>
>> On 28/05/2019 18:53, Bartosz Bi?as wrote:
>>> There is also BSD-3-Clause used in some files so there is necessity
>>> to complete licence files with them. I will prepare a new patch
>>> with that.
>>
>>  Can you also check (and specify in the commit message) if this file
>> exists in *all* versions of barebox? It is possible to configure a
>> custom version of barebox, so it can be pretty much anything...
>>
>>  Well, I checked myself: the LICENSES directory exists since
>> 2019.04.0...
>>
>>  There is unfortunately no simple way to conditionally add license
>> files: if a file specified in _LICENSE_FILES doesn't exist, it's a
>> hard error. You can use $(wildcard ...) but then you have to strip
>> off the source directory again.
> 
> Hmm, don't we have the problem with the hash of the tarball itself
> already? If you specify another version, the hash of the tar.bz2 file
> certainly does not match anymore...

 The hash of the tarball isn't checked for custom versions:

ifeq ($(BR2_TARGET_BAREBOX)$(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
endif


 Regards,
 Arnout
