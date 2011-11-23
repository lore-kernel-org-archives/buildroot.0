From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Nov 2011 23:16:58 +0100
Subject: [Buildroot] [git commit] busybox: only install S01logging if
	syslogd applet is enabled
In-Reply-To: <4ECD6C09.1090001@free-electrons.com> (Maxime Ripard's message of
 "Wed, 23 Nov 2011 22:56:25 +0100")
References: <20110704191002.1D1B48A31E@busybox.osuosl.org>
 <4ECCDBC4.8030805@free-electrons.com>
 <8739deq3pp.fsf@macbook.be.48ers.dk>
 <874nxuo6sm.fsf@macbook.be.48ers.dk>
 <4ECD6C09.1090001@free-electrons.com>
Message-ID: <87zkfmmqlh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> It is more in the case where :
 Maxime>   - The user has a custom S01logging script for rsyslog (also works
 Maxime> for all but busybox syslog)
 Maxime>   - Busybox runs first, as rsyslog depends on it
 Maxime>   - Busybox init is not enabled, so the package removes S01logging
 Maxime>   - rsyslog is built, and as there is no S01logging, installs its
 Maxime> default one.

But rsyslog already installs (unconditially, which is a bug) 01rsyslog -
People would presumably have a custom S01rsyslog file if they use
rsyslog instead of a S01logging file?

-- 
Bye, Peter Korsgaard
