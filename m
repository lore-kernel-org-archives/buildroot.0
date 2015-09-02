From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Sep 2015 23:17:41 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E76348.3020509@mind.be>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
 <55E76348.3020509@mind.be>
Message-ID: <55E76775.8030200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-09-15 22:59, Arnout Vandecappelle wrote:
> On 02-09-15 00:55, Yann E. MORIN wrote:
>> systemd is incresaingly expected things to live in /usr/bin or
> 
>  increasingly
> 
>> /usr/sbin.
>>
>> However, a lot of packages stil install stuff directly into /bin or
> 
>  still
> 
>> /sbin.
>>
>> Add an option so that /bin and /sbin be symlinks to /usr/bin and
> 
>  be -> are
> 
>> /usr/sbin. Ditto for .lib for consistency.
> 
>  .lib -> /lib

 One more thing: it would be good to mention explicitly in the commit log that
/lib64 (or /lib32 or /libx32) doesn't need to be handled because that is already
a symlink to lib.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
