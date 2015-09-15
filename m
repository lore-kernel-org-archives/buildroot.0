From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Sep 2015 00:35:35 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <55F748D0.1060905@mind.be>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <55F6CFFE.3000407@lucaceresoli.net> <55F748D0.1060905@mind.be>
Message-ID: <55F89D37.1050101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
> On 14-09-15 15:47, Luca Ceresoli wrote:
>> Dear Thomas,
>>
>> Thomas Petazzoni wrote:
>>> Dear Luca Ceresoli,
>>>
>>> On Wed, 9 Sep 2015 14:29:36 +0200, Luca Ceresoli wrote:
> [snip]
>>>> This would slightly change the current behaviour for all cases, and
>>>> start S01logging after mdev, not before. I tested it quickly and it
>>>> looks like it works. Can you think of any problem with moving S10mdev
>>>> to S00mdev?
>>>
>>> In principle, it seems better to me if the devices are all set up
>>> before starting anything else, so if it works, I'm all for S00mdev. The
>>> only question is whether mdev logs things to syslog, and if so what
>>> happens to those messages that are emitted before syslog is started.
>>
>> At a quick code inspection it looks like mdev does not use syslog.
>> I'll do some testing.
>
>   mdev doesn't but any script it calls might.

Good point. S02mdev then (if the current implementation idea will
survive at all, given the rest of the discussion).

>
>   Also, if a crash happens during mdev coldplugging, it's an advantage if the
> kernel messages can be captured by syslog.
>
>   So I'd prefer to keep syslog before mdev.
>
>   FYI: systemd starts journald and udev in parallel (at least as far as I can
> make out from the service files).
>
>   Regards,
>   Arnout
>


-- 
Luca
