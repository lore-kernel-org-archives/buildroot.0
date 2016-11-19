From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 11:22:23 +0100
Subject: [Buildroot] [PATCH v2 10/15] reproducible: enable fakedate
In-Reply-To: <9c26bf8aba6470357f9d5b178261e583@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-11-git-send-email-jezz@sysmic.org>
 <20161118124933.68b64d53@free-electrons.com>
 <9c26bf8aba6470357f9d5b178261e583@sysmic.org>
Message-ID: <0c8fd128-e07f-5ea8-b8d1-f75bfadfe196@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 14:53, J?r?me Pouiller wrote:
> On 2016-11-18 12:49, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Fri, 18 Nov 2016 10:10:19 +0100, J?r?me Pouiller wrote:
>>
>>> +ifeq ($(BR2_REPRODUCIBLE),y)
>>> +TOOLCHAIN_DEPENDENCIES += host-fakedate
>>> +endif
>>
>> Unfortunately, this means that fakedate is only installed at the end of
>> the toolchain build process. So the entire toolchain is built without
>> fakedate installed.
>>
>> Is it because we assume that the toolchain build process is safe (i.e
>> it doesn't call "date") ?
> 
> During my tests, fakedate was build before host-gcc-initial. Indeed, I
> was lucky (in add, I think toolchain build process is safe).
> 
> 
>> Perhaps it should be added in DEPENDENCIES_HOST_PREREQ instead ?
> 
> Right.

 And that can be done in the top-level BR2_REPRODUCIBLE condition.

 Regards,
 Arnout

> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
