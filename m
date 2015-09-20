From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Sep 2015 23:26:48 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <55FF1A8A.5030507@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <20150920151157.7dc9b021@free-electrons.com>
 <55FF1A8A.5030507@openmailbox.org>
Message-ID: <55FF2498.3060105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-09-15 22:43, C?dric Marie wrote:
> Hi Thomas, Arnout, and all,
> 
> Le 20/09/2015 15:11, Thomas Petazzoni a ?crit :
>> Following the discussion you had with Arnout, and your own report that
>> this patch was breaking things in the Busybox and Linux kernel build, I
>> marked this patch as "Changes Requested" in patchwork.
>>
>> Will you work on a new iteration of this patch?
> 
> Yes, I've started to work on a new iteration. It is working fine with CMake,
> autotools, and Kbuild packages (I keep on exporting KBUILD_VERBOSE as suggested
> by Arnout).
> 
> I still have to:
> 
> - modify qt.mk because it currently enables verbose mode if VERBOSE is defined
> and not empty, but my modification implies that VERBOSE may be equal to 0, and
> it should not enable verbose mode in that case!...

 Well, just unset VERBOSE when V=0. So VERBOSE is either empty or 1. Similar
with how Config.in works.

> - check that no other package .mk file is using VERBOSE variable.

git grep -w VERBOSE
-> only in qt.mk

> - write clear comments and commit message.

 Yep, very important!

 Regards,
 Arnout

> 
> Sorry for the delay, but I've got only very occasional free time to spend on it.
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
