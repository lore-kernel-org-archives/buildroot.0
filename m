From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:27:13 +0200
Subject: [Buildroot] [PATCH 2/2] lua-periphery: depend on c-periphery
	instead of cloning it
In-Reply-To: <1431784161-5771-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 May 2015 15:49:21 +0200")
References: <1431784161-5771-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431784161-5771-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4ko8b7y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > lua-periphery currently clones and builds the c-periphery library by
 > itself. This causes two problems:

 >  1/ It does not integrate properly with the download infrastructure of
 >     Buildroot, making offline builds impossible since not the entire
 >     source code is downloaded by Buildroot.

 >  2/ It does not use the latest version of c-periphery, which has some
 >     fixes contributed by Vicente to fix c-periphery on MIPS.

 > This commit fixes:

 >   http://autobuild.buildroot.org/results/0ad/0ad656970b3cbc84b5531b28155ba2f747715fe3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> +++ b/package/lua-periphery/0001-Makefile-don-t-clone-build-c-periphery.patch
 > @@ -0,0 +1,32 @@
 > +From 395bb4cb37612a4ac94346531b13ff0e901ed05e Mon Sep 17 00:00:00 2001
 > +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > +Date: Tue, 5 May 2015 23:59:17 +0200
 > +Subject: [PATCH 1/2] Makefile: don't clone/build c-periphery
 > +
 > +This patch adjusts lua-periphery Makefile to not clone and build the
 > +c-periphery library by itself, and instead of the already available

s/of/use/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
