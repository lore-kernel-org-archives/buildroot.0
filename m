From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 15:33:02 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: add a patch to link against
	SEM_INIT libs
In-Reply-To: <1254826414-20763-2-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Tue\, 6 Oct 2009 18\:53\:34 +0800")
References: <1254826414-20763-1-git-send-email-daniel@caiaq.de>
	<1254826414-20763-2-git-send-email-daniel@caiaq.de>
Message-ID: <8763armir5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> This patch is needed to make e2fsprogs being linked against
 Daniel> SEM_INIT libraries. In this particular case, it causes the
 Daniel> Makefiles to add -lpthread. Without that, all binaries crash
 Daniel> at startup, at least on x86.

But your patch removes stuff (PRIVATE_LIBS_CMT), it doesn't add
anything?

 Daniel> +-LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @PRIVATE_LIBS_CMT@ @SEM_INIT_LIB@
 Daniel> ++LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @SEM_INIT_LIB@

-- 
Bye, Peter Korsgaard
