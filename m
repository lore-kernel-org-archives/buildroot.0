From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 08:12:43 +0100
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
	timeconst.pl
In-Reply-To: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Sun, 7 Feb 2016 10:41:48 -0300")
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <87r3glrqc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > Kernels older than 3.9 (not counting stable releases) used the
 > timeconst.pl perl script for their build process.
 > The problem with this script is that it used deprecated perl features,
 > namely defined(@array) which was removed for the perl 5.22 release,
 > causing build failure of older kernels on newer distributions.

 > To fix this instead of going the hard way (moving to the new
 > timeconst.bc script) use the easy way by patching timeconst.pl with an
 > upstream patch used for stable releases.

 > First try a dry-run on the patch to see if it applies, if it does then
 > call a proper APPLY_PATCHES to it.

 > Tested against an arbitrary 2.6.30 kernel (applies and builds), against
 > 4.4.1 for a missing timeconst.pl (does not apply since it's missing) and
 > 3.8.13 (does not apply since it's fixed already).

 > Known broken distributions: fedora 23.

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > ---
 > v2: rebase on top of master

Yes, I'm afraid we need this :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
