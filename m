From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Nov 2011 16:05:22 +0100
Subject: [Buildroot] [git commit] busybox: only install S01logging if
	syslogd applet is enabled
In-Reply-To: <4ECCDBC4.8030805@free-electrons.com> (Maxime Ripard's message of
 "Wed, 23 Nov 2011 12:40:52 +0100")
References: <20110704191002.1D1B48A31E@busybox.osuosl.org>
 <4ECCDBC4.8030805@free-electrons.com>
Message-ID: <8739deq3pp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Hi Peter,

 Maxime> Looking at the init scripts installation stuff, I found this,
 Maxime> which is confusing to me.

 Maxime> There seems to be a glitch here.

Ahh yes.

 Maxime> While it shouldn't happen in the common use-case, because of
 Maxime> the dependency we set on busybox in all the logger packages, if
 Maxime> the user put his init script for another logger in the
 Maxime> skeleton, it will always remove it, and install the default
 Maxime> one.

 Maxime> Maybe the common name was not such a good idea, and that we
 Maxime> should have a distinct name for each init scripts. Or we revert
 Maxime> this commit. I don't know.

For 2011.11 I would suggest we just remove the 2nd part (E.G. removal of
init script if syslog daemon isn't enabled) - The first part is needed
to support custom S01logging scripts with busybox (E.G. I have projects
where we log to shared memory instead of files, so you need -S option to
syslogd).

Once 2011.11 is out, then we should probably rename the files to work
around this.

I'll fix - Thanks for bringing it out.

-- 
Bye, Peter Korsgaard
