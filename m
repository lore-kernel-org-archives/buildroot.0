From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 12:30:08 +0100
Subject: [Buildroot] [RFC] Add systemd to buildroot
Message-ID: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I've been working for some time on adding systemd to buildroot in a nice way. It
is now in a pretty nice state I guess, at least nice enough to send an RFC and
get some review about the basic mechanics.

While the system should boot with systemd, for a reason unknown to me, udev
doesn't take into account its rules, and don't tag the devices for systemd,
which, in turn, doesn't expose a getty.

Another problem is that I still have some sysv init scripts added to the
filesystem through the skeleton. Since it is completely static, I don't find a
good way around this problem. Maybe we don't care. I don't know.

So, give it a look, and please tell me what you think :)

Maxime
