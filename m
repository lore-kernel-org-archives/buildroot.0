From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 13:56:06 +0100
Subject: [Buildroot] [PATCH] Revert "pkg-download: remove explicit
 PKG_VERSION from github helper"
In-Reply-To: <20171113220009.3372-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 13 Nov 2017 23:00:09 +0100")
References: <20171113220009.3372-1-yann.morin.1998@free.fr>
Message-ID: <87efp12f4p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This reverts commit 1e5a8916b2ab4c9c99548fa6fbd4855eee323881.
 > The idea was that the version string can be derived because we know the
 > package name.

 > However, this patch does not account for the fact that $(pkgname) always
 > points to the latest pacakge scanned, which in all other situation we're
 > using it, is the current package, because it is used inside one ot he
 > xxx-inner macros that are $(eval)ualed. So $(pkgname) is evaluated
 > "early" and gets the expected value.

 > However, the github value is not in one of those macros, so it gets
 > evaluated "late", when doing the actual download. So, by that time,
 > $(pkgname) will expand to the last package scanned, which is actuall the
 > manual (without a br2-external tree).

 > That would require that the _SITE variable be assigned with the :=
 > assignment operator. This is weird, because that would make it the only
 > variable to require that, but only when using the github helper, which
 > is even less obvious and would cause a lot of trouble...

 > The obvious fixup would seem to be to use $(PKG) instead, because that
 > already contains the upper-case package name that vcan be used as a
 > prefix to variables.

 > However, that does not work either, because we have a check that forbids
 > a trsailing slash in _SITE, check that is done in pacakge/pkg-generic,
 > inside the xxx-inner macro, during the $(eval) call.

 > And at that time, PKG is not yet defined, because it is only defined for
 > an actual recipe.

 > So we can't seem to have a workable solution. So, just revert the patch.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
