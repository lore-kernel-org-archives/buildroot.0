From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 21:17:58 +0100
Subject: [Buildroot] [PATCH] apckage/dovecot: security bump to version
 2.3.9.3
In-Reply-To: <20200213200313.32228-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 13 Feb 2020 21:03:13 +0100")
References: <20200213200313.32228-1-peter@korsgaard.com>
Message-ID: <87y2t6dyx5.fsf@dell.be.48ers.dk>
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
 > ??- message is large enough that message-parser returns multiple body
 >     blocks
 > ??- The first block(s) don't contain the full snippet (e.g.  full of
 >     whitespace)
 > ??- input ends with '>'

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ups, typo in $SUBJECT :/

-- 
Bye, Peter Korsgaard
