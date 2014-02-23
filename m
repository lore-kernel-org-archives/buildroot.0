From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 12:30:09 +0100
Subject: [Buildroot] [PATCH] pixman: fix patch for FE_DIVBYZERO detection
In-Reply-To: <1393150105-8421-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 23 Feb 2014 11:08:25 +0100")
References: <1393150105-8421-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738jaqd6m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit a9baea4345625f6f00fc59395faec83e08346015 ('pixman: add patch
 > to fix Microblaze build failure'), a patch is added to the pixman
 > package to avoid using the FE_DIVBYZERO definition when it is not
 > available. However, it was using the have_fe_divbyzero variable to
 > define or not HAVE_FEDIVBYZERO, while the AC_CHECK_DECL autoconf macro
 > sets the ac_cv_have_decl_FE_DIVBYZERO variable.

 > The end result was that the FE_DIVBYZERO macro was considered as never
 > being available. This commit fixes that by using the appropriate
 > variable.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
