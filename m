From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 11:40:02 +0100
Subject: [Buildroot] [PATCH] ruby: assume we always have finite,
	isinf and isnan for uClibc
In-Reply-To: <20170207094759.45076-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 7 Feb 2017 09:47:59 +0000")
References: <20170207094759.45076-1-Vincent.Riera@imgtec.com>
Message-ID: <87vasmthbx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > uClibc has __finite, __isinf and __isnan, and Ruby's configure script
 > checks for finite, isinf and isnan (note the missing leading __).
 > Because of the naming difference the checks fail, therefore the symbols
 > HAVE_FINITE, HAVE_ISINF and HAVE_ISNAN are not defined.
 > Ruby code relies on those symbols in order to define its own version of
 > the finite, isinf and isnan functions. Since the symbols haven't been
 > defined, those definitions cause conflicts with the already-existing
 > functions.

 > Fixes:
 >   http://autobuild.buildroot.net/results/f34/f34dc20749c6f6d12c51eddf3ee6c2ef41d7c13d/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed after extending the description and adding a comment in the
.mk file, thanks.

-- 
Bye, Peter Korsgaard
