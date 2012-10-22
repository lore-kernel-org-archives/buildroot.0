From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Oct 2012 09:50:57 +0200
Subject: [Buildroot] [PATCH v2] libplayer: fix handling of cflags in
	configure
In-Reply-To: <500542BE.40504@mind.be> (Arnout Vandecappelle's message of "Tue, 
 17 Jul 2012 12:47:26 +0200")
References: <1342301676-23857-1-git-send-email-arnout@mind.be>
 <20120715215100.7e280618@skate> <500542BE.40504@mind.be>
Message-ID: <87txtnndwe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 07/15/12 21:51, Thomas Petazzoni wrote:
 >> Le Sat, 14 Jul 2012 23:34:36 +0200,
 >> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
 >> 
 >>> Problem was found when compiling libplayer with GStreamer support
 >>> on x86_64 with a Sourcery toolchain.
 >> 
 >> I've tried to build libplayer with gstreamer support for x86_64 with a
 >> Sourcery toolchain, and I didn't had an issue. Since your problem was
 >> quoting related, I thought that it could be caused by the ccache
 >> support, but it isn't.
 >> 
 >> Can you post the .config that triggers the problem, or provide more
 >> details on the problem? It's not that I don't believe that there is a
 >> problem, but without producing it, I feel a bit out of infos to review
 >> the patch.

 Arnout>  The config is an allpackageyesconfig from which I removed a
 Arnout> few packages that don't work on x86_64 or that can't be
 Arnout> downloaded anymore.  I've attached the defconfig.  You'd best
 Arnout> interrupt the build after the cross-compiler is extracted and
 Arnout> then run 'make libplayer' explicitly, or you'll have to wait
 Arnout> for hours for the build to finish...

Committed, thanks. The issue also triggered on the autobuilder
yesterday:

http://autobuild.buildroot.net/results/2a22f33410197f5cf546bf1974c2e168d1b1a070/build-end.log

-- 
Bye, Peter Korsgaard
