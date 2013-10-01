From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Oct 2013 21:55:43 +0200
Subject: [Buildroot] [PATCH 1 of 2] make clean: improve when no .config
	present
In-Reply-To: <524B0477.1030604@mind.be> (Arnout Vandecappelle's message of
 "Tue, 01 Oct 2013 19:20:55 +0200")
References: <patchbomb.1380539365@argentina>
 <2c5cb4c167d3cb700c22.1380539366@argentina>
 <20130930140438.713b4879@skate> <524B0477.1030604@mind.be>
Message-ID: <87k3hwu5og.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> Note: we could improve the HOST_DIR cleanup by removing
 >>> 'output/host' unconditionally, but it's an assumption. Let me know
 >>> your thoughts on this, it could be fixed in another patch.
 >> 
 >> Hum, yeah, indeed. This means that the contents of output/host are not
 >> removed, which is quite annoying. I don't immediately see a solution to
 >> this problem, though.

 Arnout>  I would be OK with defining HOST_DIR as $(BASE_DIR)/host before
 Arnout> .config is included. If .config exists, it will be overridden
 Arnout> afterwards.

Yes, that sounds like a plan. The only potential issue is if somebody
builds out of tree _AND_ has changed the BR2_HOST_DIR _AND_ runs make clean
in a directory where they have an important 'host' subdir.

That's probably all fairly unlikely to be a real issue.

-- 
Bye, Peter Korsgaard
