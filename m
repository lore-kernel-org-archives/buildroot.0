From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jun 2015 00:49:40 +0200
Subject: [Buildroot] [PATCH] Don't export VERBOSE unless V=1 (for CMake)
In-Reply-To: <1435095367-4223-1-git-send-email-cedric.marie@openmailbox.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Marie"'s message of "Tue, 23 Jun 2015 23:36:06
 +0200")
References: <1435095367-4223-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <87fv5g4t8b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "C?dric" == C?dric Marie <cedric.marie@openmailbox.org> writes:

 > CMake verbose mode is based on VERBOSE environment variable.
 > * If VERBOSE is exported but empty, only "Dependee ... is newer than
 > depender ..." messages are shown.
 > * If VERBOSE is exported and set (whatever the value), all compilation
 > commands are shown.

 > VERBOSE is currently systematically exported by Buildroot, even if it
 > is empty, in the root Makefile, which implies that the "light" verbose
 > mode - with "Dependee ... is newer than depender ..." messages - is
 > always enabled.

 > VERBOSE should only be exported when V=1, which is the standard way to
 > enable verbose mode in Buildroot.

 > Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
