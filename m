From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 14:18:16 +0200
Subject: [Buildroot] [PATCH v2 1/2] util-linux: add a check for
	mkostemp()
In-Reply-To: <1396787854-29725-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 6 Apr 2014 14:37:33 +0200")
References: <1396787854-29725-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87k3b0aubb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > mkostemp() is missing with older version of uClibc (uClibc <= 0.9.33).
 > So, we need to check if mkostemp() is available.
 > If not, we use a wrapper function based on mkstemp() to implement it.

 > Since util-linux v2.23, mkostemp() is called with O_CLOEXEC flag.
 > If we use a define to mkstemp() to implement mkostemp(), flags will be
 > discared.
 > mkstemp() will pass O_RDWR|O_CREAT|O_EXCL, but not O_CLOEXEC, which
 > means that the file descriptor will no longer be closed automatically
 > upon exec().

 > To avoid to discard the flags, we add a call to fcntl() to set O_CLOEXEC
 > flag just after mkstemp().

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 > v2: add a check for mkostemp() instead of using a define for uClibc case. (ThomasP)

Committed both, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
