From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 Nov 2013 18:46:40 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: disable on AVR32
In-Reply-To: <20131103121851.2d2cc3b0@skate>
References: <1383209956-31840-1-git-send-email-alexander.lukichev@gmail.com>
 <527295EE.9030801@mind.be> <52762F23.9010202@gmail.com>
 <20131103121851.2d2cc3b0@skate>
Message-ID: <52768C00.9030402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/13 12:18, Thomas Petazzoni wrote:
> Dear Alexander Lukichev,
>
> On Sun, 03 Nov 2013 13:10:27 +0200, Alexander Lukichev wrote:
>
>>>>    config BR2_PACKAGE_ZEROMQ_PGM
>>>>        bool "PGM/EPGM support"
>>>>        depends on BR2_PACKAGE_ZEROMQ
>>>> +    depends on !BR2_avr32
>>>   zeromq has a lot of reverse dependencies: cppzmq, czmq, filemq,
>>> mongrel2, [python-pyzmq not necessary because python needs MMU], [zmqpp
>>> already disabled for avr32]. And there's one more transitive dependency
>>> to zyre. So all these should also be disabled.
>>
>> I do not understand. Why should they be disabled? This patch does not
>> disable the zeromq library, merely PGM support in it. I may be mistaken
>> but "users" of zeromq that we have in Buildroot do not actually require
>> this feature (PGM support). Or am I missing the point?
>
> You're correct, I believe Arnout missed the fact that the dependency is
> added on a sub-option of the ZeroMQ package, and not on the ZeroMQ
> package itself, and there is nothing that selects
> BR2_PACKAGE_ZEROMQ_PGM.

  Indeed, sorry for the noise.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
