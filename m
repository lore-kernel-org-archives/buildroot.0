From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Jun 2009 22:20:39 +0200
Subject: [Buildroot] Problem making buildroot
In-Reply-To: <24075410.post@talk.nabble.com> (jdzielski@stevens.edu's message
	of "Wed\, 17 Jun 2009 08\:25\:55 -0700 \(PDT\)")
References: <24075410.post@talk.nabble.com>
Message-ID: <87d4928ve0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jdzielski" == jdzielski  <jdzielski@stevens.edu> writes:

Hi,

 jdzielski> Sorry if this is a multiple post.  It's showing up in the
 jdzielski> list that I see but there is an indication that he message
 jdzielski> hasn't been accepted.

 jdzielski> Hi,
 jdzielski>     I'm new at trying to do things at this level, but I'm trying to make the
 jdzielski> buildroot on Ubuntu 8.04.  I've been following the instructions at
 jdzielski> http://docwiki.gumstix.org/index.php/Buildroot which is pretty straight

You should probably ask the gumstix people for details, but this looks
like the problem with binutils 2.17.x only expecting makeinfo to have
a single digit after the '.' in it's version, and hence breaking with
makeinfo 4.1x.

We have a patch for that:

http://git.buildroot.net/buildroot/tree/toolchain/binutils/2.17/500-fix-makeinfo-check.patch

Any particular reason why you are using such an old binutils version?

-- 
Bye, Peter Korsgaard
