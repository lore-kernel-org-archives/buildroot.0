From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:04:14 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/boost: atomics needs always lockfree atomic bytes
In-Reply-To: <20201205221525.236045-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 Dec 2020 23:15:25 +0100")
References: <20201205221525.236045-1-fontaine.fabrice@gmail.com>
Message-ID: <87im8b59cx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since version 1.74.0, boost atomics needs a toolchain that always
 > supports lockfree atomic bytes so add dependendy on
 > BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS:
 > https://github.com/boostorg/atomic/issues/42

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c03a786791e3aa7801cf1bff9934c4a105f54ce1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Use && instead of ||?in bitcoin and gqrx comment
 >  - Drop select of boost-atomic in boost-thread
 >  - Update reverse dependencies of boost-thread: boost-context,
 >    boost-coroutine, boost-fiber, boost-locale, boost-type_erasure,
 >    boost-wave

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
