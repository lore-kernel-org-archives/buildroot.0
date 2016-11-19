From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 17:10:41 +0100
Subject: [Buildroot] [PATCH v2 05/15] reproducibility/linux: override
 build timestamp
In-Reply-To: <3760418.eHefN4R8xK@sagittea>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-6-git-send-email-jezz@sysmic.org>
 <20161118124035.2a18431b@free-electrons.com> <3760418.eHefN4R8xK@sagittea>
Message-ID: <7cd8ea06-fe33-1d6a-8cc1-289fdab4f6a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 14:53, J?r?me Pouiller wrote:
> On Friday 18 November 2016 12:40:35 Thomas Petazzoni wrote:
>> Hello,
>>
>> On Fri, 18 Nov 2016 10:10:14 +0100, J?r?me Pouiller wrote:
>>
>>> +ifeq ($(BR2_REPRODUCIBLE),y)
>>> +LINUX_MAKE_ENV += \
>>> +	KBUILD_BUILD_VERSION=1 \
>>> +	KBUILD_BUILD_USER=buildroot \
>>> +	KBUILD_BUILD_HOST=buildroot \
>>> +	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
>>
>> With your "fakedate" script, do we really need this last line?
> 
> I prefer to use native solution when upstream provide one. I hope one
> day all packages will be fixed by upstream and we could get ride of
> fakedate.

 +1 to that. Could you explain this in the commit message?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
