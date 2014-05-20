From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 00:27:11 +0200
Subject: [Buildroot] [PATCH 0/3 v2] Detect and prevent multiple
	providers (branch yem/fix-virt-pkg)
In-Reply-To: <cover.1400175284.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 15 May 2014 19:37:01 +0200")
References: <cover.1400175284.git.yann.morin.1998@free.fr>
Message-ID: <87lhtwf5mo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Hello All!

 > Following a weird report about a cairo build failure, we came to the
 > conclusion that the problem was due to multiple providers of the same
 > virtual package were selected in the failing configuration. See the
 > thread starting there:
 >     http://lists.busybox.net/pipermail/buildroot/2014-May/096379.html

 > The matter was discussed on the list, and we came up to the conclusion
 > we would not implement anything in the menuconfig to prevent this
 > situation, but that we would just detect it prior to running the build.
 > See the thread starting there:
 >     http://lists.busybox.net/pipermail/buildroot/2014-May/096517.html

 > So, what this series does is just that: detect that more than one
 > provider for a virtual package are selected.

 > The way it does that is fully described in patch 1/3, but basically:

 >   - providers must now declare the virtual packages they are an
 >     implementation of, in their .mk file;

 >   - the generic package infrastructure checks that for each such
 >     declared virtual package, the current provider is indeed the
 >     selected implmenetation. If not, then it means two or more
 >     providers for that virtual package are selected, and it bails
 >     out very early in the build.

 > Changes v1 -> v2:
 >   - fix providers for luainterpreter  (Thomas P.)

Committed series, thanks.

-- 
Bye, Peter Korsgaard
