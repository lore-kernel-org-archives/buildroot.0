From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 14:32:10 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <55F02630.5050500@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
Message-ID: <55F026CA.9070804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-15 14:29, Luca Ceresoli wrote:
> But ehen, if any user has an S05something that uses /dev, it would
> break. In order to reduce the risk to nearly zero, we might move
> S10mdev to S00mdev, so it runs (most likely) as the first script.
> 
> This would slightly change the current behaviour for all cases, and
> start S01logging after mdev, not before. I tested it quickly and it
> looks like it works. Can you think of any problem with moving S10mdev
> to S00mdev?

 I'd prefer to have logging before mdev, so any fallout from mdev will appear in
the logs. So for me, S02mdev is fine.

 In my mdev-using projects I usually have a custom mdev script (to do more
extensive coldplugging) and I also move it to S02.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
