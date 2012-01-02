From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 02 Jan 2012 10:58:03 +0100
Subject: [Buildroot] [RFC] Add systemd to buildroot
In-Reply-To: <201112200749.10389.arnout@mind.be>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <201112200749.10389.arnout@mind.be>
Message-ID: <4F017FAB.6050001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 20/12/2011 07:49, Arnout Vandecappelle wrote:
> On Wednesday 23 November 2011 12:30:08 Maxime Ripard wrote:
>> I've been working for some time on adding systemd to buildroot in a nice way. It
>> is now in a pretty nice state I guess, at least nice enough to send an RFC and
>> get some review about the basic mechanics.
> 
>  You didn't get much comments, so I'll try to do some review.  No testing though.

Thanks :)

>> While the system should boot with systemd, for a reason unknown to me, udev
>> doesn't take into account its rules, and don't tag the devices for systemd,
>> which, in turn, doesn't expose a getty.
> 
>  This is of course a show-stopper for inclusion.  People expect the git
> HEAD to work.

Of course, and I expect it too, this is one of the reason I flagged the
patchset as an RFC and not an actual patch :)

>> Another problem is that I still have some sysv init scripts added to the
>> filesystem through the skeleton. Since it is completely static, I don't find a
>> good way around this problem. Maybe we don't care. I don't know.
> 
>  I guess you mean the S20urandom and S40network in the skeleton?  For the
> moment, I don't think it's a problem to leave them there.  To fix it, you
> could include a target-install hook that removes them (which obviously still
> leaves the init scripts installed by other packages, but that should be
> fixed separately per package).

I'm not very fond of removing them neither. So let's forget them :)

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
