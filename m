From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Mar 2012 22:57:04 +0100
Subject: [Buildroot] [PATCH 1/2] ccache: Force ccache to use its
	internal zlib.
In-Reply-To: <17bf5a67401f522c5a6d704c60713087106a4c29.1331148403.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 7 Mar 2012 20:26:49 +0100")
References: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
 <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
 <17bf5a67401f522c5a6d704c60713087106a4c29.1331148403.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aa3qeoy7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The problem is that without this, ccache would link against the zlib
 Thomas> of the build system, but we might build and install a different
 Thomas> version of zlib in $(O)/host afterwards, which ccache will pick
 Thomas> up. This might break if there is a version mismatch. A solution would
 Thomas> be to add host-zlib has a dependency of ccache, but it would require
 Thomas> tuning the zlib .mk file to use HOSTCC_NOCCACHE as the
 Thomas> compiler. Instead, we take the easy path: tell ccache to use its
 Thomas> internal copy of zlib, so that ccache has zero dependency besides the
 Thomas> C library.

Committed, thanks.

-- 
Bye, Peter Korsgaard
