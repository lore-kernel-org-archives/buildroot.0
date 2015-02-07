From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Feb 2015 21:27:41 +0100
Subject: [Buildroot] [0/21] Add missing indirect dependencies
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 4 Feb 2015 01:33:58 +0100")
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <87zj8p5uwy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 >  With the fix for randconfig that I made in
 > http://patchwork.ozlabs.org/patch/432554/ it is now possible to run
 > 'make randconfig' and get usable results. So I ran the following loop
 > to detect missing indirect dependencies:

 > while true; do make randconfig 2>&1 | grep warning; done

 > If there is a missing indirect dependency, this will output a line like:

 > warning: (BR2_PACKAGE_UTIL_LINUX_SETPRIV) selects BR2_PACKAGE_LIBCAP_NG which has unmet direct dependencies (!BR2_avr32)

Committed with the minor issues pointed out by Jerzy Grzegorek fixed,
thanks.


>  It would be good to include such a test in a jenkins job to detect this
 > type of error earlier.

Indeed. Maxime, is that something you can setup?

-- 
Bye, Peter Korsgaard
