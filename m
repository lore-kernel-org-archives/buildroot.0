From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:39:13 +0100
Subject: [Buildroot] [PATCH v2] package/dovecot: security bump to
 version 2.3.9.3
In-Reply-To: <20200213201933.3124-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 13 Feb 2020 21:19:32 +0100")
References: <20200213201933.3124-1-peter@korsgaard.com>
Message-ID: <87y2s4z2la.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-7046: Truncated UTF-8 can be used to DoS submission-login and
 >   lmtp processes
 >   lib-smtp doesn't handle truncated command parameters properly, resulting
 >   in infinite loop taking 100% CPU for the process.  This happens for LMTP
 >   (where it doesn't matter so much) and also for submission-login where
 >   unauthenticated users can trigger it.

 > - CVE-2020-7957: Specially crafted mail can crash snippet generation
 >   Snippet generation crashes if:
 >   - message is large enough that message-parser returns multiple body
 >     blocks
 >   - The first block(s) don't contain the full snippet (e.g.  full of
 >     whitespace)
 >   - input ends with '>'

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 >  - Fix subject
 >  - Drop unicode from commit text

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
