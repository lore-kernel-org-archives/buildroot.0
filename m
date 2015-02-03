From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 10:10:33 +0100
Subject: [Buildroot] [PATCH 09/16] package/minidlna: improve systemd
	support
In-Reply-To: <CAKErNvpuMEN3jztGodJWJUzBTtc8uYKi6edwkWOhbW_MeWesQw@mail.gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-10-git-send-email-maxtram95@gmail.com>
 <CAHXCMMK3JOMLvyp74gyG7W2GVDocBX8tG6q0Ny+cK-SeRXPxUA@mail.gmail.com>
 <CAKErNvpuMEN3jztGodJWJUzBTtc8uYKi6edwkWOhbW_MeWesQw@mail.gmail.com>
Message-ID: <54D09089.4090104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/15 22:30, Maxim Mikityanskiy wrote:
>> To make minidlna compliant with non-systemd ssytem, you should add the
>> > user using _USERS infra [1].
> There were two reasons I preferred sysusers over _USERS.


 I think that where possible, we should use sysusers on a systemd system and
_USERS on a non-systemd system. Perhaps the _USERS infrastructure should be
extended to do this automatically - AFAIK there is no advantage of using a
static user when you use systemd, right? Except of course when the package
requires one specific UID, but IIRC even that can be encoded in the sysusers
configuration, no?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
