From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Sun, 03 Nov 2013 13:10:27 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: disable on AVR32
In-Reply-To: <527295EE.9030801@mind.be>
References: <1383209956-31840-1-git-send-email-alexander.lukichev@gmail.com>
 <527295EE.9030801@mind.be>
Message-ID: <52762F23.9010202@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

10/31/2013 07:39 PM, Arnout Vandecappelle wrote:
>> +comment "openpgm is BROKEN on AVR32"
>> +    depends on BR2_avr32
>  This comment isn't needed. We don't do it for other packages, and
> adding it would make it even more work to disable architectures.
Understood. I was angry at openpgm :)

>>   config BR2_PACKAGE_ZEROMQ_PGM
>>       bool "PGM/EPGM support"
>>       depends on BR2_PACKAGE_ZEROMQ
>> +    depends on !BR2_avr32
>  zeromq has a lot of reverse dependencies: cppzmq, czmq, filemq,
> mongrel2, [python-pyzmq not necessary because python needs MMU], [zmqpp
> already disabled for avr32]. And there's one more transitive dependency
> to zyre. So all these should also be disabled.

I do not understand. Why should they be disabled? This patch does not
disable the zeromq library, merely PGM support in it. I may be mistaken
but "users" of zeromq that we have in Buildroot do not actually require
this feature (PGM support). Or am I missing the point?

Thanks for your comments!

--
Best regards,
  Alexander Lukichev
