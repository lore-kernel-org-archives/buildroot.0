From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 23:17:10 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: do not depend on
	the top-level Buildroot's .config
In-Reply-To: <1363644183-29242-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 18 Mar 2013 23:03:03 +0100")
References: <1363644183-29242-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87mwu0wdy1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Previously, the crosstool-NG backend did depend on the top-level
 Yann> Buildroot's .config to detect changes in the toolchain options,
 Yann> using a tentatively-clever heuristic, which also included the full
 Yann> Buildroot's version string to push down to set the components' versions
 Yann> strings.

 Yann> In doing so, any commit in the Buildroot tree would imply a complete
 Yann> rebuild of the toolchain, even in the case the toolchain options did
 Yann> not change, thus being a large annoyance (to say the least).

 Yann> As Buildroot never guaranteed that toolchain options would be detected,
 Yann> even less handled, and that the internal backend does neither detect nor
 Yann> act on toolchain options changes, and delegate that to the user, there
 Yann> is no point in individualising the crosstool-NG backend's behaviour.

 Yann> This reasoning also applies to the depdency on the crosstool-NG's bundled
 Yann> .config file, too.

 Yann> So, just drop the not-so-clever heuristic, and just build the toolchain
 Yann> once, leaving to the user the responsibility to explictly ask Buildroot
 Yann> to rebuild the toolchain.

Committed, thanks.

-- 
Bye, Peter Korsgaard
