From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:07:04 +0200
Subject: [Buildroot] [PATCHv2 04/14] gcc: fix Fortran support
In-Reply-To: <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:30 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eh8pkd53.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit fixes the Fortran support in the gcc package by making
 Thomas> sure that the runtime Fortran library is properly installed to the
 Thomas> target.

 Thomas> It also takes this opportunity to slightly reword the Config.in option
 Thomas> help text, to no longer mention gcc < 4.2 since they are no longer
 Thomas> supported in Buildroot, and to have a more meaningful explanation.

 Thomas> Finally, it fixes the gcc-final.mk code to use the correct
 Thomas> BR2_INSTALL_FORTRAN option rather than the non-existing
 Thomas> BR2_GCC_CROSS_FORTRAN option, to decide whether Fortran support should
 Thomas> be enabled or not in the cross-compiler.

Committed, thanks.

I wonder if we shouldn't deprecate fortran (and objc) support and get
rid of them. Is there really a use case for them? Any interesting sw
that needs them?

-- 
Bye, Peter Korsgaard
