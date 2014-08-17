From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Aug 2014 09:12:11 +0200
Subject: [Buildroot] [PATCH 2/2] libnftnl: add patch to avoid symbol
	conflict
In-Reply-To: <1408196148-15128-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 Aug 2014 15:35:48 +0200")
References: <1408196148-15128-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408196148-15128-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tsfzj1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When ELF binaries and shared libraries are used, the internal
 > functions of libnftnl such as xfree() are not visible to the outside
 > world (their visibility is 'hidden'). Therefore, the fact that other
 > programs (especially nftables) may have symbols with the same name
 > does not cause any problem.

 > However, when doing static linking on a non-ELF platform (such as
 > Blackfin, which uses the FLAT binary format), there is no way of
 > encoding this visibility. Therefore, the xfree() symbols of libnftnl
 > becomes visible to the outside world, causing a conflict with the
 > xfree() symbol defined by nftables.

 > To solve this, this patch renames the libnftnl xfree() function to
 > libnftnl_xfree().

 > This commit fixes a problem seen after building nftables statically on
 > Blackfin. This problem was seen after the previous patch fixing the
 > autobuilder failure:

 >   http://autobuild.buildroot.org/results/98b/98b707ffdeeb1cda94b7c1019ef29cf5fd7db8bf/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
