From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 20:39:07 +0100
Subject: [Buildroot] [PATCH] mcookie: correct wrong memset argument
In-Reply-To: <20180110220303.27944-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 10 Jan 2018 23:03:03 +0100")
References: <20180110220303.27944-1-peter@korsgaard.com>
Message-ID: <876081fvac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #10216
 > Building mcookie generates a warning about possible wrong arguments to
 > memset:

 > mcookie.c:207:26: warning: argument to ?sizeof? in ?memset? call is the same expression
 >   as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
 >      memset(ctx, 0, sizeof(ctx)); /* In case it's sensitive */

 > ctx is a pointer to a structure, so the code should use the size of the
 > structure and not the size of the pointer when it tries to clear the
 > structure, similar to how it got fixed upstream back in 2009:

 > https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/lib/md5.c?id=6596057175c6ed342dc20e85eae8a42eb29b629f

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
