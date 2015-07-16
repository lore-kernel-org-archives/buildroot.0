From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Jul 2015 00:56:58 +0200
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
 skeleton
In-Reply-To: <CAGduivwRsW1SPqnNuncicLy5geAL72PZtfdbMydr5qncG_4DTg@mail.gmail.com>
References: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150716230722.304e5f9a@free-electrons.com>
 <55A81F61.3050307@zacarias.com.ar>
 <20150716233553.4d46b3d0@free-electrons.com>
 <CAGduivwRsW1SPqnNuncicLy5geAL72PZtfdbMydr5qncG_4DTg@mail.gmail.com>
Message-ID: <55A836BA.8050905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/16/15 23:42, Maxime Hadjinlian wrote:
> 
> On Jul 16, 2015 11:35 PM, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
[snip]
>> I agree with you that this is a change in behavior, but I would say
>> it's a change for good: making people realize that using a custom
>> skeleton very often doesn't work as they intend it to work.
>>
>> Any opinions from others?
> I agree that a custom skeleton is not the proper way to go and leads to more
> errors and trouble than anything.
> I would remove the possibility entirely.

 I have one use case that still needs a custom skeleton (i.e. I found no other
way to handle it). There's a system where I want /bin to symlink to /usr/bin, to
avoid some problems with wrong absolute paths in scripts. Turns out that doing
that in a post-build script doesn't work because some other symlinks get broken,
so it needs to be done in the skeleton...

 Now, Peter wasn't against changing the default skeleton to do exactly that,
because it also solves the issue when busybox installs something in /bin while
the full version installs it in /usr/bin. So in that case, yes we could probably
eliminate the custom skeleton. Though there may be other cases.


 Regards,
 Arnout

> I can cook up a patch at that effect.
> It would greatly disturb many user though. It needs to be well thought through.
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
