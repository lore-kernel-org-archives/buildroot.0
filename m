From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 09:29:29 +0200
Subject: [Buildroot] [PATCH] kmod: add patch to fix build failure with
	old gcc versions
In-Reply-To: <1496501970-9676-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Jun 2017 16:59:30 +0200")
References: <1496501970-9676-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vao89rxi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When building with old gcc versions (such as gcc 4.3), the current
 > version of kmod fails with:

 > shared/util.c:52: error: expected identifier or '(' before 'do'
 > shared/util.c:52: error: expected identifier or '(' before 'while'

 > This is due to a use of the internal assert_cc() macro outside of a
 > function, while this macro is defined for old gcc versions in a way that
 > cannot be used outside functions.

 > This wasn't noticed by the autobuilders because we don't have such old
 > target compilers. On the host side, we have some autobuilder instances
 > with such old gcc versions, but host-kmod is only used by the linux
 > package, which is never tested by the autobuilders.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to master and 2017.05.x (2017.02.x doesn't look affected), thanks.

-- 
Bye, Peter Korsgaard
