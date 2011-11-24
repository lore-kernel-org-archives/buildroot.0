From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 24 Nov 2011 09:03:12 +0100
Subject: [Buildroot] [git commit] busybox: only install S01logging if
 syslogd applet is enabled
In-Reply-To: <87zkfmmqlh.fsf@macbook.be.48ers.dk>
References: <20110704191002.1D1B48A31E@busybox.osuosl.org>
 <4ECCDBC4.8030805@free-electrons.com> <8739deq3pp.fsf@macbook.be.48ers.dk>
 <874nxuo6sm.fsf@macbook.be.48ers.dk> <4ECD6C09.1090001@free-electrons.com>
 <87zkfmmqlh.fsf@macbook.be.48ers.dk>
Message-ID: <4ECDFA40.8030508@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/11/2011 23:16, Peter Korsgaard wrote:
>>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> 
>  Maxime> It is more in the case where :
>  Maxime>   - The user has a custom S01logging script for rsyslog (also works
>  Maxime> for all but busybox syslog)
>  Maxime>   - Busybox runs first, as rsyslog depends on it
>  Maxime>   - Busybox init is not enabled, so the package removes S01logging
>  Maxime>   - rsyslog is built, and as there is no S01logging, installs its
>  Maxime> default one.
> 
> But rsyslog already installs (unconditially, which is a bug) 01rsyslog -
> People would presumably have a custom S01rsyslog file if they use
> rsyslog instead of a S01logging file?

Oh yes, you're right, rsyslog has S01rsyslog. Well it was my intent to
do so at first then, but I didn't submitted anything to do it that way.

Sorry about that :)

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
