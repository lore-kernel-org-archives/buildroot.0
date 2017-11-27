From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:38:13 +0100
Subject: [Buildroot] [PATCH] qt: add patch to fix build on non-x86
 platforms
In-Reply-To: <20171117230225.14153-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 18 Nov 2017 00:02:25 +0100")
References: <20171117230225.14153-1-thomas.petazzoni@free-electrons.com>
Message-ID: <877euccb96.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to Qt that adjusts its build system to
 > properly support building on non-x86 platforms. The problem was due to
 > the PLATFORM and XPLATFORM variables having the same value when
 > building on a ppc64le system targetting an uncommon architecture
 > (Xtensa or ARC for example). We fix this problem by making sure
 > PLATFORM and XPLATFORM will always be different.

 > Fixes the following build failures occuring on gcc112 (a ppc64le
 > autobuilder machine):

 >   http://autobuild.buildroot.net/results/527747a2fbb31195bb6fdb37cfdaa624e69b7d68/
 >   (qt on xtensa)

 >   http://autobuild.buildroot.net/results/7db1265f6f34be3a498881564292517a8fc0e44e/
 >   (qt on ARC)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
