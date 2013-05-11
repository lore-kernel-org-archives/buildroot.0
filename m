From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 23:31:12 +0200
Subject: [Buildroot] [PATCH v3 1/7] gstreamer1: Add gstreamer version
	1.0.7 package
In-Reply-To: <518D8507.3060909@mind.be> (Arnout Vandecappelle's message of
 "Sat, 11 May 2013 01:38:47 +0200")
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
 <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
 <518D8507.3060909@mind.be>
Message-ID: <87k3n5yzj3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout>  Hi Spenser,
 Arnout>  Very quick first review...

 Arnout>  First of all, a comment that is not so much directed at you but at
 Arnout> the rest of the BR developers: the naming issue.

 Arnout>  We have a tendency to make a copy of a package when there is a major
 Arnout> version change, cfr. python3 and qt5. However, in this case, I don't
 Arnout> think it's a good idea. At this time, many (most?) gstreamer
 Arnout> downstreams have already moved to 1.x. Also, no more patches will be
 Arnout> made the the 0.10 series (though distro's may still make patches). So
 Arnout> we can expect the old gstreamer stuff to die out relatively
 Arnout> quickly. But if we call the new thing gstreamer1 now, we're
 Arnout> essentially stuck with that name for all eternity.

I'm not so sure. If you look at the other recent major version upgrades
(python/qt/gtk), it seems to me like people aren't jumping on the new
version right away. I had several people asking me if qt4 would still be
available once qt5 got added.

I think the nicest thing we can do for our users is just to add the new
package next to the existing when these incompatible major version
upgrades happen, so they can chose themselves when/if they want to
upgrade. I agree that gstreamer1 perhaps isn't the nicest name, but it
isn't too bad either, and for python/qt/gtk the names are commonly used.


 Arnout>  So instead I'd try to make 0.10 or 1.0 a choice in the gstreamer
 Arnout> package itself.  For me it's fine if inside the Config.in and the .mk
 Arnout> files we basically have the two versions in a big ifeq() construct,
 Arnout> but at least we can keep on using the BR2_PACKAGE_GST* symbols.

What would the advantage be? Just that people could move from gstreamer
0.10 to 1.0 without adjusting their config?


 Arnout>  Obviously, there will be some packages that break down when
 Arnout> gstreamer 1.0 is used, but we'll have to discover that at some
 Arnout> point anyway.

Like the closed source imx stuff.

-- 
Bye, Peter Korsgaard
