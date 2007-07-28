From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sat, 28 Jul 2007 20:11:45 +0200 (CEST)
Subject: [Buildroot] [bug] util-linux
Message-ID: <0707281915430.10821@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem: building util-linux fails with umount.c: undefined reference to
`xdr_string'

One of the reasons is BR2_INET_RPC was not priorly enabled.
BR2_PACKAGE_UTIL-LINUX should depend on BR2_INET_RPC.
If BR2_PACKAGE_UTIL-LINUX (and implicitly BR2_INET_RPC) is enabled when
the buildroot is already built, uclibc (and all other packages depending
on uclibc) should also be rebuilt. WCHAR is also in there somewhere...

Oh dear, this is going nowhere :(

Is there some sort of make target that will clean all that's built (and
doesn't also clean my local modifications, dl-dir and stuff)?


Cheers,

-- 
Cristian
