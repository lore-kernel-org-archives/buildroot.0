From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Sep 2014 21:47:25 +0200
Subject: [Buildroot] [PATCH] strace: Apply an upstream patch to fix
	sa_restorer problems
In-Reply-To: <1411034805-27839-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 18 Sep 2014 11:06:45 +0100")
References: <1411034805-27839-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87mw9w678y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Wrap sa_restorer member definitions in #ifdef SA_RESTORER to be
 > consistent with their use.
 > If an architecture does not provide sa_restorer members but still
 > defines SA_RESTORER macro, the latter has to be explicitly undefined.

 > This change fixes compilation failures like this one:
 > signal.c: In function 'decode_old_sigaction':
 > signal.c:631:21: error: 'struct old_sigaction' has no member named
 > 'sa_restorer'
 > signal.c: In function 'decode_new_sigaction':
 > signal.c:1224:21: error: 'struct new_sigaction' has no member named
 > 'sa_restorer'

 > * signal.c (struct old_sigaction, struct old_sigaction32,
 > struct new_sigaction, struct new_sigaction32):
 > Wrap sa_restorer member in #ifdef SA_RESTORER.
 > (decode_old_sigaction, decode_new_sigaction):
 > Wrap use of sa32.sa_restorer in #ifdef SA_RESTORER.

 > Upstream commit:
 >   https://sourceforge.net/p/strace/code/ci/c3a5c01051ba29a9f421f4d45d96bbc32df2b796/

 > Fixes:
 >   http://autobuild.buildroot.net/results/93e/93e54d8aecc5c178cc3465eb9fd5415461325285/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
