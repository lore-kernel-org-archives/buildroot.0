From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 11:30:14 +0200
Subject: [Buildroot] [PATCH] tslib: speed up the build by skipping
	autoreconf
In-Reply-To: <1493284513-7365-1-git-send-email-martin.kepplinger@ginzinger.com>
 (Martin Kepplinger's message of "Thu, 27 Apr 2017 11:15:13 +0200")
References: <1493284513-7365-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <87k266kxjt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:

 > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
 > ---
 > hi,

 > this is more of a question what buildroot's stand is on this. Can there be
 > benefit from doing autoreconf in a real tarball release? In case there is
 > no patch against the relevant build sources, I guess not, but you'll know
 > better.

Committed, thanks.

In Buildroot we only do autoreconf if it is needed, E.G. if we have a
patch modifying one of the auto* files (configure.ac, Makefile.am,
..). Apparently the AUTORECONF = YES line was not removed from tslib.mk
when such patches were removed in a version bump.

-- 
Bye, Peter Korsgaard
