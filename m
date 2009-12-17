From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Dec 2009 22:47:19 +0100
Subject: [Buildroot] development environment
In-Reply-To: <200912172131.19962.korgull@home.nl> (Marcel's message of "Thu,
	17 Dec 2009 21:31:19 +0100")
References: <200912172131.19962.korgull@home.nl>
Message-ID: <87fx7946jc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcel" == Marcel  <korgull@home.nl> writes:

 Marcel> Hi,

 Marcel> I'm trying to create a workable environment to work with
 Marcel> buildroot for the following :

 Marcel> I use a stable buildroot (which I may regularly upgrade) and
 Marcel> will be adding kernel modules, board configurations and
 Marcel> packages for my own design.  The documentation is very clear
 Marcel> how to add the packages, so that's no issue.

 Marcel> The issue I have is that I want to use CVS for my own developed
 Marcel> files and need to set up a workable environment to work
 Marcel> efficiently to create patches for buildroot.

We're almost in 2010 - Are you really sure you want to do development
with CVS today?

I've been using a similar setup like your with subversion and git
without any big issues.

 Marcel> On the other hand, just creating patches is not a real option
 Marcel> as I should be able to compile just one kernel module in order
 Marcel> to efficiently test it without requiring a full rebuild of the
 Marcel> kernel. Rebuilding the kernel module would require me to edit
 Marcel> the patched files within buildroot, but it's very hard to use
 Marcel> CVS from that environment because my files are all over the
 Marcel> place in buildroot. I can copy files, but this isn't very good
 Marcel> practice either.

I would suggest that you do your basic kernel development by hand first
and only integrate it into buildroot. BR is very nice for automating
stuff, but for doing actual kernel development I prefer the flexibility
of building by hand.

Also the kernel is very simple to build yourself as there's no external
dependencies.

-- 
Bye, Peter Korsgaard
