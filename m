From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Feb 2015 16:59:26 +0100
Subject: [Buildroot] [PATCH] freetype: Add config option for bzip2
	compressed font support
In-Reply-To: <5444216A.3060103@mind.be> (Arnout Vandecappelle's message of
 "Sun, 19 Oct 2014 22:39:06 +0200")
References: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
 <5442672B.1000500@mind.be> <3620793.9UjUVpDraY@hyperion>
 <5444216A.3060103@mind.be>
Message-ID: <87pp9rasv5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>>> So unless you can show me a use case where it makes a real impact, it's a
 >>> NACK.
 >> 
 >> The menu we're using (GMenu2X) uses FreeType via SDL_ttf, not via a large 
 >> GUI toolkit. Dropping the libbzip2 dependency reduces the number of 
 >> libraries loaded from 12 to 11. I haven't benchmarked how many milliseconds 
 >> of a difference that makes in startup time.
 >> 
 >> Note that the only place where bzip2 compression is actually supported by 
 >> FreeType is when opening PCF files. Disabling the feature has no effect on 
 >> support for other font formats such as TTF.

 >  Okay, let's leave it up to the Benevolent Dictator to make the call. If it's a
 > go, and the depends on is changed into a select like Maxime requested, it gets
 > my Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Sorry - We discussed it at the Buildroot developer days, and agreed that
it it isn't worth the trouble to have an explicit option for this.

-- 
Bye, Peter Korsgaard
