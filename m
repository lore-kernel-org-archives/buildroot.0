From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Sep 2014 21:53:19 +0200
Subject: [Buildroot] [PATCH] jq: add patch to fix y0, y1,
	j0 and j1 related build issue on uClibc
In-Reply-To: <1410080085-30040-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 7 Sep 2014 10:54:45 +0200")
References: <1410080085-30040-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87iokzky1c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Our default uClibc configuration does not have DO_XSI_MATH=y, so it
 > lacks certain math functions. jq generates some wrappers for the libm
 > functions, even for functions that are not actually used by jq. By
 > simply removing those wrappers, we get jq to build on uClibc that have
 > DO_XSI_MATH disabled.

 > Fixes:

 >   http://autobuild.buildroot.org/results/831/831ffb0a37a8007b2a824659e46dbe9e6e710d6f/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
