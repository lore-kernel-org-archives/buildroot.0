From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Oct 2014 22:43:28 +0200
Subject: [Buildroot] [PATCH v2] libevent: Use github call & fix patch
In-Reply-To: <20141019085013.GD4072@free.fr>
References: <1413135162-16654-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141019085013.GD4072@free.fr>
Message-ID: <54442270.6020109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/14 10:50, Yann E. MORIN wrote:
> Maxime, All,
> 
> On 2014-10-12 19:32 +0200, Maxime Hadjinlian spake thusly:
[snip]
>>  LIBEVENT_VERSION = 2.0.21
>> -LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>> -LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
>> +LIBEVENT_SITE = $(call github,libevent,libevent,release-$(LIBEVENT_VERSION)-stable)
> 
> This should be:
> 
>     LIBEVENT_VERSION = release-2.0.21-stable
>     LIBEVENT_SITE = $(call github,libevent,libevent,$(LIBEVENT_VERSION))
> 
> I think we already talked about this in the past few days (for another
> such change), where we said that the version should be the tag used by
> upstream.

 Perhaps we should remove the third argument of the github helper and instead
use $($(PKG)_VERSION) instead, to avoid this kind of confusion...


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
