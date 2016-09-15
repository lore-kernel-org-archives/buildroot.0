From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 22:07:42 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
	root filesystem removal
In-Reply-To: <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be> (Arnout
 Vandecappelle's message of "Thu, 15 Sep 2016 18:35:42 +0200")
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
Message-ID: <87y42tc4fl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 15-09-16 12:04, Peter Korsgaard wrote:
 >> I'll put out a 2016.08.1 release with this Saturday or Sunday. Anything
 >> else that should be included in this bugfix release?

 >  There are still a whole bunch of autobuilder fixes that came in after the
 > release, but probably most of these are due to -next things.

 >  Things like
 > 4e9292f package/fbterm: fix download site

This is not really critical as we have a copy on sources.b.o, but OK, it
is also not a "dangerous" change.

 > 3ca860a glibc: fix MIPS and SPARC builds for glibc < 2.24 with recent binutils
 > could be useful as well.

Isn't that just for fixing builds against binutils 2.27 (which isn't in 2016.08)?

 >  But nothing is really screaming that it should be included.

Ok. We should probably figure out if we need to revert the CMAKE_SYSROOT
addition (e8c3755676) and include that if needed.

-- 
Venlig hilsen,
Peter Korsgaard 
