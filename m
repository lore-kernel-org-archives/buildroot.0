From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:35:52 +0100
Subject: [Buildroot] [PATCH 09/28] xlib_libX11: do not depend on
	bigreqsproto nor xcmiscproto
In-Reply-To: <486cd706eb60bff58da00f26470d07495b998385.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:21 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <486cd706eb60bff58da00f26470d07495b998385.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fw263wzr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The BR2_PACKAGE_XPROTO_BIGREQSPROTO option was selected by
 Thomas> xlib_libX11, but xlib_libX11 does not have this protocol package in
 Thomas> its DEPENDENCIES. In some builds, it leads to xproto_bigreqsproto to
 Thomas> be built as the last package, with no other package depending on it,
 Thomas> which doesn't make sense.

 Thomas> xproto_xcmiscproto was selected and part of DEPENDENCIES, but an
 Thomas> inspection of libX11 configure.ac and libX11 source code shows that it
 Thomas> does not depend on xcmiscproto at all.

Committed, thanks.

-- 
Bye, Peter Korsgaard
