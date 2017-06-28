From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:26:52 +0200
Subject: [Buildroot] [PATCH] util-linux: fix compilation when libc lacks
	wide-character support
In-Reply-To: <1498582983-19532-1-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Tue, 27 Jun 2017 14:03:03 -0300")
References: <1498582983-19532-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <87h8yzerc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > A recent change in util-linux left calls to wcstok and wcspbrk not
 > guarded by "#ifdef HAVE_WIDECHAR". This causes build failures when
 > libc does not have the wide-character functions, like some uClibc
 > builds.

 > Solve the broblem by means of a patch already sent upstream.

s/broblem/problem/ (here and in the patch).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
