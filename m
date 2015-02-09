From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Feb 2015 00:06:32 +0100
Subject: [Buildroot] [0/21] Add missing indirect dependencies
In-Reply-To: <20150209164314.GB2079@lukather> (Maxime Ripard's message of
 "Mon, 9 Feb 2015 17:43:14 +0100")
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
 <87zj8p5uwy.fsf@dell.be.48ers.dk> <20150209164314.GB2079@lukather>
Message-ID: <87egpy3csn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

>> > while true; do make randconfig 2>&1 | grep warning; done
 >> 
 >> > If there is a missing indirect dependency, this will output a line like:
 >> 
 >> > warning: (BR2_PACKAGE_UTIL_LINUX_SETPRIV) selects
 >> > BR2_PACKAGE_LIBCAP_NG which has unmet direct dependencies
 >> > (!BR2_avr32)
 >> 
 >> Committed with the minor issues pointed out by Jerzy Grzegorek fixed,
 >> thanks.
 >> 
 >> 
 >> >  It would be good to include such a test in a jenkins job to detect this
 >> > type of error earlier.
 >> 
 >> Indeed. Maxime, is that something you can setup?

 > Unfortunately, Jenkins has been down for quite some time now, and I
 > still haven't got the time to fix it.

:/

 > What would be the test to setup?

As Arnout suggested - a number of make randconfig 2>&1 | grep warning
calls that shouldn't generate any output at all.

-- 
Venlig hilsen,
Peter Korsgaard 
