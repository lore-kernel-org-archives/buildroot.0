From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 22:47:35 +0200
Subject: [Buildroot] [PATCH 3/4] cups: fix static linking problem
In-Reply-To: <1463235434-31134-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 14 May 2016 16:17:13 +0200")
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463235434-31134-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h9dl9860.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In static linking configurations, cups fails to build due to the lack of
 > Scrt1.o from uClibc toolchains. This Scrt1.o is only needed for PIE
 > binaries. Since we don't really care about PIE binaries in the context
 > of Buildroot, this commit solves the problem by patching cups to not
 > generate a PIE binary.

 > Fixes:

 >   http://autobuild.buildroot.net/results/445a401da2f63a6c43d7c166516287db6cc977ab/

 > Cc: Olivier Schonken <olivier.schonken@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
