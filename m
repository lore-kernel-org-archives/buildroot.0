From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 21 Sep 2015 12:23:09 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_Makefile=3A_Remove_KBUILD=5FVER?=
 =?utf-8?q?BOSE_and_quiet?=
In-Reply-To: <55FF2498.3060105@mind.be>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <20150920151157.7dc9b021@free-electrons.com>
 <55FF1A8A.5030507@openmailbox.org> <55FF2498.3060105@mind.be>
Message-ID: <be665633918344391cf5a86576592c7c@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-09-20 23:26, Arnout Vandecappelle a ?crit?:
>> - modify qt.mk because it currently enables verbose mode if VERBOSE is 
>> defined
>> and not empty, but my modification implies that VERBOSE may be equal 
>> to 0, and
>> it should not enable verbose mode in that case!...
> 
>  Well, just unset VERBOSE when V=0. So VERBOSE is either empty or 1. 
> Similar
> with how Config.in works.

Well, the idea was to set VERBOSE in Makefile and use its value in 
infrastructures.
In autotools I need to make the difference between VERBOSE=1 (force 
verbose), VERBOSE=0 (force non-verbose), and VERBOSE not set (keep 
package default verbose level).

Unless we decide that finally there is no real interest in forcing 
non-verbose and adding a new possibility with 'make V=0'.
I'm not so sure it can be very usefull, since it will only be taken into 
account by a few autotools package.
If you want a quiet output, you'd rather use 'make -s'
NB: I found it in Makefile, but it doesn't seem to be documented...


-- 
C?dric
