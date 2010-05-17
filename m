From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 May 2010 09:47:40 +0200
Subject: [Buildroot] [PATCH 1/8] Add a BR2_NEEDS_GETTEXT option
In-Reply-To: <332ed1e3ae5fa11372d522c9c0d03cc01475866a.1273836748.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 14 May 2010 13:37:24 +0200")
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<332ed1e3ae5fa11372d522c9c0d03cc01475866a.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87eihb0y1v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When using an external toolchain that uses the glibc or eglibc C
 Thomas> libraries, compiling a separate gettext and libintl is not needed and
 Thomas> is even a source of confusion, causing build failures. These build
 Thomas> failures are due to the fact that when libintl is compiled, it
 Thomas> replaces the C library libintl.h by its own, which does #define
 Thomas> gettext libintl_gettext. Then, when packages want to use gettext,
 Thomas> autoconf realize that gettext is available in the C library and
 Thomas> therefore do not add -lintl to the LDFLAGS, causing the build failure
 Thomas> because the program has been compiled to use libintl_gettext but this
 Thomas> function is not available.

 Thomas> Therefore, we should use gettext if a uClibc internal toolchain or a

/should use/should only use/
 
 Thomas> +config BR2_NEEDS_GETTEXT
 Thomas> +	bool
 Thomas> +	default y if BR2_TOOLCHAIN_BUILDROOT
 Thomas> +	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 Thomas> +	default n if BR2_TOOLCHAIN_EXTERNAL_GLIBC

You don't really need the 'default n' (as that's default), but ok.

-- 
Bye, Peter Korsgaard
