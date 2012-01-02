From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Jan 2012 15:52:30 +0100
Subject: [Buildroot] [PATCH 2/3] Rework of the init system
In-Reply-To: <4F017E4D.4020004@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <1322047811-12933-3-git-send-email-maxime.ripard@free-electrons.com>
 <201112200903.41149.arnout@mind.be>
 <4F017E4D.4020004@free-electrons.com>
Message-ID: <20120102155230.1844769f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 02 Jan 2012 10:52:13 +0100,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> Well mutually exclusive init systems is the more obvious solution.
> Having an sysv init and systemd should be ok at the same time should be
> ok indeed, at least from a filesystem and boot point of view, but it
> will probably be more problematic for the init scripts.

I agree that we should only support mutually exclusive init systems.
Doing otherwise would make things much more complicated, with no real
benefit. Buildroot is mostly aimed at small to medium sized embedded
systems, and for those, it would really be strange to have multiple
init systems in place at the same time, even though in theory they
could live together.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
