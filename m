From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jan 2021 17:02:53 +0100
Subject: [Buildroot] [PATCH v2] packago/go: security bump to version
 1.15.7
In-Reply-To: <20210120083652.6067-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 20 Jan 2021 09:36:52 +0100")
References: <20210120083652.6067-1-peter@korsgaard.com>
Message-ID: <87eeie9t1u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - cmd/go: packages using cgo can cause arbitrary code execution at build time

 >   The go command may execute arbitrary code at build time when cgo is in use
 >   on Windows.  This may occur when running ?go get?, or any other command
 >   that builds code.  Only users who build untrusted code (and don?t execute
 >   it) are affected.

 >   In addition to Windows users, this can also affect Unix users who have ?.?
 >   listed explicitly in their PATH and are running ?go get? or build commands
 >   outside of a module or with module mode disabled.

 >   Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this issue.

 >   This issue is CVE-2021-3115 and Go issue golang.org/issue/43783.

 > - crypto/elliptic: incorrect operations on the P-224 curve

 >   The P224() Curve implementation can in rare circumstances generate
 >   incorrect outputs, including returning invalid points from ScalarMult.

 >   The crypto/x509 and golang.org/x/crypto/ocsp (but not crypto/tls) packages
 >   support P-224 ECDSA keys, but they are not supported by publicly trusted
 >   certificate authorities.  No other standard library or golang.org/x/crypto
 >   package supports or uses the P-224 curve.

 >   The incorrect output was found by the elliptic-curve-differential-fuzzer
 >   project running on OSS-Fuzz and reported by Philippe Antoine (Catena cyber).

 >   This issue is CVE-2021-3114 and Go issue golang.org/issue/43786.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
