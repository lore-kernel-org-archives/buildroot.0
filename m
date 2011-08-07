From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Aug 2011 21:27:37 +0200
Subject: [Buildroot] [PATCH 1/2] toochain/crosstool-NG: bump version
In-Reply-To: <1312744789-21603-2-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Sun, 7 Aug 2011 21:19:48 +0200")
References: <1312744789-21603-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1312744789-21603-2-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87sjpdkonq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

Hi,

 Yann> +Makefile: allow recursion
 Yann> +
 Yann> +When crosstool-NG is used standalone, we completely avoid recursion,
 Yann> +because the Makefile calls itself only once.
 Yann> +
 Yann> +But when used as the buildroot toolchain backend, there is already
 Yann> +one level of make recursion when we first call the crosstool-NG
 Yann> +Makefile. And when buildroot is used out-of-tree, we are already
 Yann> +at the second level of recursion when calling the crosstool-NG
 Yann> +Makefile.
 Yann> +
 Yann> +So, to cope with the situation, only bail out at the 2nd level of
 Yann> +recursion, not the 0-th level.
 Yann> +
 Yann> +This probably won't go upstream.
 Yann> +
 Yann> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
 Yann> +
 Yann> +diff -durN crosstool-ng-1.12.0.orig//Makefile.in crosstool-ng-1.12.0/Makefile.in
 Yann> +--- crosstool-ng-1.12.0.orig//Makefile.in	2011-08-01 01:21:34.000000000 +0200
 Yann> ++++ crosstool-ng-1.12.0/Makefile.in	2011-08-07 14:37:02.678715954 +0200
 Yann> +@@ -95,7 +95,7 @@
 Yann> + # level.
 Yann> + # This has the side effect of only showing the real targets, and hiding our
 Yann> + # internal ones. :-)
 Yann> +-ifneq ($(MAKELEVEL),0)
 Yann> ++ifneq ($(MAKELEVEL),2)

Doesn't this then break for in-tree builds? How about just removing
these 3 lines instead?

 Yann> + $(error Recursion detected, bailing out...)
 Yann> + endif

-- 
Bye, Peter Korsgaard
