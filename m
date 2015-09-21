From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Sep 2015 19:11:33 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <be665633918344391cf5a86576592c7c@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <20150920151157.7dc9b021@free-electrons.com>
 <55FF1A8A.5030507@openmailbox.org> <55FF2498.3060105@mind.be>
 <be665633918344391cf5a86576592c7c@openmailbox.org>
Message-ID: <56003A45.8050306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-09-15 12:23, C?dric Marie wrote:
> Le 2015-09-20 23:26, Arnout Vandecappelle a ?crit :
>>> - modify qt.mk because it currently enables verbose mode if VERBOSE is defined
>>> and not empty, but my modification implies that VERBOSE may be equal to 0, and
>>> it should not enable verbose mode in that case!...
>>
>>  Well, just unset VERBOSE when V=0. So VERBOSE is either empty or 1. Similar
>> with how Config.in works.
> 
> Well, the idea was to set VERBOSE in Makefile and use its value in infrastructures.
> In autotools I need to make the difference between VERBOSE=1 (force verbose),
> VERBOSE=0 (force non-verbose), and VERBOSE not set (keep package default verbose
> level).

 Right, sorry, I forgot about that.

> 
> Unless we decide that finally there is no real interest in forcing non-verbose
> and adding a new possibility with 'make V=0'.
> I'm not so sure it can be very usefull, since it will only be taken into account
> by a few autotools package.

 A few? Isn't it going to be a very large subset of the 1041 autotools packages?

> If you want a quiet output, you'd rather use 'make -s'
> NB: I found it in Makefile, but it doesn't seem to be documented...

 True. 'make -s' is documented in the make documentation of course, but it would
make sense to also mention it in the buildroot documentation close to the V=1.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
