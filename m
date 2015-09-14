From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Sep 2015 22:19:12 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <20150914213404.4fdd36a5@free-electrons.com>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <20150909132929.5c01433e@free-electrons.com>
 <55F6F060.2060901@lucaceresoli.net>
 <20150914213404.4fdd36a5@free-electrons.com>
Message-ID: <55F72BC0.7050306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-15 21:34, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
> 
> On Mon, 14 Sep 2015 18:05:52 +0200, Luca Ceresoli wrote:
> 
>> But now I removed that patch, and replaced with a different
>> implementation based on Arnout's suggestion of using BUSYBOX_DEVICES.
> 
> I am not sure using BUSYBOX_DEVICES is fully correct. The reason
> why /dev/console is needed is *not* because of Busybox, but because of
> the kernel that is opening /dev/console before handing control over
> to the init application:
> 
>   http://lxr.free-electrons.com/source/init/main.c#L1011
> 
> If you do BUSYBOX_DEVICES with just /dev/console, then you will also
> need a SYSVINIT_DEVICES with just /dev/console.
> 
> Though I admit my comment here is mainly nitpicking :)

 But of course you are right. This is part of the system/skeleton handling, and
now skeleton is a package, we can make it part of SKELETON_DEVICES.

 Regards,
 Arnout

> 
>>> One thing I dislike a bit is that there is quite a bit overlap between
>>> S10mdev and activate-mdev. As Arnout suggested, can you just mount a
>>> tmpfs in /dev in the inittab in the "mdev without devtmpfs" case, and
>>> then keep the normal S10mdev script?
>>
>> v2 will do things this way.
> 
> Great!
> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
